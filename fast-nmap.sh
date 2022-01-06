#!/bin/bash

# This script executes a nmap scan and then performs a detailed scan only on the identified ports. The results are written to a text file.

echo "Insert target IP and press return to start fast nmap scan:"

read ip

echo "Starting fast nmap scan..."

sudo nmap -T4 -p- $ip > nmap-results.txt

ports=$(awk '{print $1}' nmap-results.txt | sed 's/[^0-9]*//g' | awk '!/^$/' | sed 's/$/,/' | tr --delete '\n' | sed 's/.$//')

echo "The following open ports were identified:"
echo "-----"
echo "${ports}"
echo "-----"
echo "Starting detailed scan on identified ports..."

sudo nmap -T3 -A -p $ports $ip > nmap-detailed-results.txt

echo "Results were written to nmap-detailed-results.txt."
echo "----"
cat nmap-detailed-results.txt
