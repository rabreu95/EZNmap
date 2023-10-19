#!/bin/bash

. ./eznmaplib.sh --source-only


echo "$opener1"

echo "$opener2"
echo " "
while :
do
    echo "Please enter the host" 
    read -p ">> " host
    echo "How fast would you like to run this scan (Please enter a single digit between 1-5)"
    read -p ">> " speed
    echo "Please enter the command"
    read -p ">> " com
    $com
done