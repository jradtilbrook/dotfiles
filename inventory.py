#!/usr/bin/env python3

import argparse
import json
import platform
import sys

parser = argparse.ArgumentParser(description='Generate Ansible host name aliases based on the OS.')
parser.add_argument('--list', action='store_true', default=True,
                    help='List hosts (default: True)')
parser.add_argument('--host', action='store',
                    help='Required by Ansible. Prints empty JSON object')
args = parser.parse_args()

# default output data for all OSes
output = {
        '_meta': {
            'hostvars': {
                'localhost': {
                    'ansible_connection': 'local'
                }
            }
        }
    }

# determine the OS and add aliases and extra variables as required
if platform.system().lower() == 'darwin': # MacOS
    output['macos'] = ['localhost']
elif platform.system().lower() == 'linux': # Arch Linux
    output['archlinux'] = ['localhost']

# if called with --host, just print out the host variables
if args.host:
    if args.host in output:
        output = output['_meta']['hostvars']['localhost']
    else:
        output = {}

# pretty print the output JSON object
print(json.dumps(output, indent=4))
