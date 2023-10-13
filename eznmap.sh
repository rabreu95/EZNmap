#!/bin/bash

. ./eznmaplib.sh --source-only


echo "$opener1"
echo "$opener2"

read -p "Please enter the host: " host
read -p "How fast would you like to run this scan (Please enter a single digit between 1-5): " speed
read -p "Please enter the command: " com
read -p "Enter a name for the output file: " output

$com