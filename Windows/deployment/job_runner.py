import sys
import logging
import re
import argparse
import os

def start_parser():
    # Main
    print sys.argv

    asset = None

    parser = argparse.ArgumentParser(description="Install software on machines")
    parser.add_argument('-j', '--job', metavar='JOB', type=str, default='',
                        help='Client assetbuilds to update')
    args = parser.parse_args()

    if args == "google":
        sys.path.append()

if __name__ == '__main__':
    start_parser()

