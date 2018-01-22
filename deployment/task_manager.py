import sys
import logging
import json
import zipfile
import re
import argparse
import os
import shutil
import platform
import subprocess
import urllib
import time
import getpass
from pprint import pprint


def start_parser():
    # Main
    print "STARTING DEPLOYMENT SCRIPT"

    asset = None

    parser = argparse.ArgumentParser(description="Install software on machines")
    parser.add_argument('-t', '--task', metavar='TASK', type=str, default='',
                        help='Client assetbuilds to update')
    args = parser.parse_args()

    current_task = args.task

    tasks_directory = "C:\\dev\\Microsoft\\deployment\\tasks"

    tasks = os.listdir(tasks_directory)

    for task in tasks:
        if current_task == task:
            task_file = "{}\\{}".format(tasks_directory, current_task)
            jobs = _get_jobs_from_task(task=task_file)

            for job in jobs:
                _parse_data(job=job)


def _get_jobs_from_task(task=basestring):
    with open(task, "r") as jobs:
        data = jobs.readlines()

    jobs = []
    for line in data:
        jobs.append(line.strip())

    return jobs


def _parse_data(job=basestring):
    root = os.path.dirname(os.path.abspath(__file__))

    data = json.load(open("{root}/jobs/{job}.json".format(root=root, job=job)))

    if data["type"] == "script":
        if "url" in data["paths"]["source"]:
            _download_from_url(name=data["name"], url=data["paths"]["source"]["url"], destination=data["paths"]["source"]["local"])
        target = "{a}{b}".format(a=os.getenv('USERPROFILE'), b=data["paths"]["source"]["local"])
        _run_script(path=target)
    if data["type"] == "copypaste":
        source = data["paths"]["source"]["server"]
        target = "{a}{b}".format(a=os.getenv('USERPROFILE'), b=data["paths"]["source"]["local"])
        _run_copy_paste(source=source, target=target, run_after=True)
    elif data["type"] == "msiexec":
        if "server" in data["paths"]["source"]:
            source = data["paths"]["source"]["server"]
            target = "{a}{b}".format(a=os.getenv('USERPROFILE'), b=data["paths"]["source"]["local"])
            _run_copy_paste(source=source, target=target, run_after=False)
        elif "url" in data["paths"]["source"]:
            _download_from_url(name=data["name"], url=data["paths"]["source"]["url"], destination=data["paths"]["source"]["local"])

        _run_exe(data=data)
    elif data["type"] == "exe":
        if "server" in data["paths"]["source"]:
            source = data["paths"]["source"]["server"]
            target = "{a}{b}".format(a=os.getenv('USERPROFILE'), b=data["paths"]["source"]["local"])
            _run_copy_paste(source=source, target=target, run_after=False)
        elif "url" in data["paths"]["source"]:
            _download_from_url(name=data["name"], url=data["paths"]["source"]["url"], destination=data["paths"]["source"]["local"])

        _run_exe(data=data)



    # if data["type"] == "command":
    #     for path in data["paths"]["source"]:
    #         for key, val in  data["command"].iteritems():
    #             command = val
    #             _run_command(path=path, command=command, exec_type=data["type"])
    # else:
    #     if "url" in data["paths"]["source"]:
    #         if data["paths"]["source"]["url"]:
    #             source = data["paths"]["source"]["url"]
    #             import urllib
    #             print "DOWNLOADING", job
    #             urllib.urlretrieve(source, data["paths"]["source"]["local"])
    #
    #     if data["paths"]["source"]["local"]:
    #         if "server" in data["paths"]["source"]:
    #             server_source = str(data["paths"]["source"]["server"])
    #         source = data["paths"]["source"]["local"]
    #         if "zipped" in data and data["zipped"]:
    #             if data["zipped"]:
    #                 source = data["paths"]["source"]["zipped"]
    #                 if os.path.exists(source) is False:
    #                     shutil.copyfile(server_source, source)
    #                 if os.path.exists(data["paths"]["source"]["local"]) is False:
    #                     _unzip(source=data["paths"]["source"]["zipped"], target=data["paths"]["source"]["local"])
    #         else:
    #             if os.path.exists(source) is False:
    #                 shutil.copyfile(server_source, source)
    #
    #     if "executable" in data["paths"]["source"]:
    #         source = data["paths"]["source"]["executable"]
    #
    #     command = _get_commands(data=data["command"])
    #     exec_type = data["type"]
    #
    #     print "\n"
    #     print "PREPARING DATA"
    #     print "-" * 80
    #     print "SOURCE", source
    #     print "COMMAND", command
    #     print "-" * 80
    #     print "---DATA READY---"
    #
    #     _run_command(path=source, command=command, exec_type=exec_type)


def _download_from_url(name=None, url=None, destination=None):
    destination = "{a}{b}".format(a=os.getenv('USERPROFILE'), b=destination)
    if os.path.exists(destination) is False:
        print "DOWNLOADING {}".format(name)
        _ensure_directory_exists(destination)
        urllib.urlretrieve(url, destination)


def _run_script(path=None):
    if path:
        active_process = subprocess.Popen(path, shell=True)
        active_process.wait()


def _run_exe(data=None):
    print "INSTALLING {} {}".format(data["name"], data["version"])
    if data:
        path = "{a}{b}".format(a=os.getenv('USERPROFILE'), b=data["paths"]["source"]["local"])

        command = None

        for key, val in data["command"].iteritems():
            if command is None:
                command = "{}".format(val)
            else:
                command = "{} {}".format(command, val)

        exec_command = "powershell.exe Start-Process -FilePath {path} -ArgumentList '{arguments}'".format(path=path, arguments=command)

        active_process = subprocess.Popen(exec_command)
        active_process.wait()


def _run_copy_paste(source=None, target=None, run_after=False):
    print "COPYING {} TO {}".format(source, target)
    if os.path.exists(source):
        if os.path.exists(target) is False:
            _ensure_directory_exists(target)
            shutil.copyfile(src=source, dst=target)
            if run_after:
                _run_script(target)


def _ensure_directory_exists(path=None):
    if not os.path.exists(os.path.dirname(path)):
        os.makedirs(os.path.dirname(path))


def _unzip(source=basestring, target=basestring):
    print "\n"
    print "UNZIPPING FILE"
    print "-" * 80
    print "SOURCE", source
    print "TARGET", target
    print "-" * 80
    zip = zipfile.ZipFile(source, 'r')
    zip.extractall(target)
    zip.close()
    print "FINISHED UNZIPPING FILE"


def _get_commands(data=None):
    command = ""
    if data:
        for key, val in data.iteritems():
            command = "{} {}".format(command, val)

    return command.strip()


def _run_command(path=basestring, command=basestring, exec_type=basestring):
    powershell = "powershell.exe"
    if exec_type == "msiexec":
        exec_command = "{} Start-Process -FilePath msiexec -ArgumentList '{} {}' -Wait".format(powershell, command, path)
    elif exec_type == "exe":
        exec_command = "{} Start-Process -FilePath {} -ArgumentList '{}' -Wait".format(powershell, path, command)
    elif exec_type == "custom":
        exec_command = "powershell {} {}".format(path, command)
    elif exec_type == "python":
        exec_command = "python {}".format(path)
    elif exec_type == "command":
        exec_command = "{} {}".format(command, path)
    else:
        return

    print "\n"
    print "STARTING INSTALLATION"
    print "-" * 80
    print "EXECUTION TYPE", exec_type
    print "EXECUTION COMMAND", exec_command
    print "-" * 80

    sp.Popen(exec_command, shell=True)
    # sp.call(['runas', '/savedcred', '/user:darrenpaul', exec_command], shell=True)

    print "---FINISHED INSTALLING---"

if __name__ == '__main__':
    start_parser()