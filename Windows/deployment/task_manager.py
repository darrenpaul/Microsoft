import sys
import logging
import json
import zipfile
import re
import argparse
import os
import shutil
import platform
import subprocess as sp
import getpass
from pprint import pprint


def start_parser():
    # Main
    print sys.argv

    asset = None

    parser = argparse.ArgumentParser(description="Install software on machines")
    parser.add_argument('-t', '--task', metavar='TASK', type=str, default='',
                        help='Client assetbuilds to update')
    args = parser.parse_args()

    current_task = args.task

    tasks_directory = "C:\\dev\\Microsoft\\Windows\\deployment\\tasks"

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
    data = json.load(open("C:/dev/Microsoft/Windows/deployment/jobs/{}.json".format(job)))

    source = None
    if data["paths"]["source"]["local"] is not True:
        if data["paths"]["source"]["url"]:
            source = data["paths"]["source"]["url"]
            import urllib
            print "DOWNLOADING", job
            urllib.urlretrieve(source, data["paths"]["source"]["local"])
    if data["paths"]["source"]["local"]:
        if "server" in data["paths"]["source"]:
            server_source = str(data["paths"]["source"]["server"])
        source = data["paths"]["source"]["local"]
        if "zipped" in data:
            if data["zipped"]:
                source = data["paths"]["source"]["zipped"]
                if os.path.exists(source) is False:
                    shutil.copyfile(server_source, source)
                if os.path.exists(data["paths"]["source"]["local"]) is False:
                    _unzip(source=data["paths"]["source"]["zipped"], target=data["paths"]["source"]["local"])
        else:
            if os.path.exists(source) is False:
                shutil.copyfile(server_source, source)

    if "executable" in data["paths"]["source"]:
        source = data["paths"]["source"]["executable"]

    command = _get_commands(data=data["command"])
    exec_type = data["type"]

    print "\n"
    print "PREPARING DATA"
    print "-" * 80
    print "SOURCE", source
    print "COMMAND", command
    print "-" * 80
    print "---DATA READY---"

    _run_command(path=source, command=command, exec_type=exec_type)


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
    else:
        return

    print "\n"
    print "STARTING INSTALLATION"
    print "-" * 80
    print "EXECUTION TYPE", exec_type
    print "EXECUTION COMMAND", exec_command
    print "-" * 80

    sp.call(['runas', '/savedcred', '/user:darrenpaul', exec_command], shell=True)

    print "---FINISHED INSTALLING---"

if __name__ == '__main__':
    start_parser()