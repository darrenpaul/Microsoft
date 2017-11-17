import sys
import logging
import json
import re
import argparse
import os
import platform
from subprocess import Popen, PIPE, call
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
        source = data["paths"]["source"]["local"]

    command = _get_commands(data=data["command"])
    exec_type = data["type"]

    print "-" * 80
    print "-" * 80
    print "SOURCE", source
    print "COMMAND", command
    print "-" * 80
    print "-" * 80

    _run_command(path=source, command=command, exec_type=exec_type)


def _get_commands(data=None):
    command = ""
    if data:
        for key, val in data.iteritems():
            command = "{} {}".format(command, val)

    return command.strip()


def _run_command(path=basestring, command=basestring, exec_type=basestring):
    powershell = "powershell.exe"
    if exec_type == "msiexec":
        exec_command = "{} Start-Process -FilePath msiexec -ArgumentList '{} {}' -Wait".format(powershell, path, command)
    elif exec_type == "exe":
        exec_command = "{} Start-Process -FilePath {} -ArgumentList '{}' -Wait".format(powershell, path, command)
    else:
        return

    print "-" * 80
    print "-" * 80
    print "EXECUTION TYPE", exec_type
    print "EXECUTION COMMAND", exec_command
    print "-" * 80
    print "-" * 80

    Popen(exec_command, shell=True)

if __name__ == '__main__':
    start_parser()
