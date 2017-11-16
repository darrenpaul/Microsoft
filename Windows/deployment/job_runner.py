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
    parser.add_argument('-j', '--job', metavar='JOB', type=str, default='',
                        help='Client assetbuilds to update')
    args = parser.parse_args()

    job = args.job

    if job == "google":
        _parse_data()

def _parse_data():
    data = json.load(open("C:/dev/Microsoft/Windows/deployment/jobs/google_chrome.json"))

    source = data["paths"]["source"]["local"]

    command = "{} {}".format(_get_commands(data=data["command"]), source)

    print "-" * 140
    print "-" * 140
    print "SOURCE", source
    print "COMMAND", command
    print "-" * 140
    print "-" * 140

    _run_command(command=command)

def _get_commands(data=None):
    command = ""
    if data:
        for key, val in data.iteritems():
            command = "{} {}".format(command, val)

    return command.strip()

def _run_command(command=basestring):
    powershell = "C:/WINDOWS/system32/WindowsPowerShell/v1.0/powershell.exe"
    # command = "{} -Command Start-Process -FilePath msiexec -ArgumentList {} -Wait".format(powershell, command)
    command = "powershell.exe Start-Process -FilePath msiexec -ArgumentList '{}' -Wait".format(command)
    print command
    Popen(command, shell=True)
    # call(command)

if __name__ == '__main__':
    start_parser()
