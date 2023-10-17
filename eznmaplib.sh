#!/bin/bash

opener1="Welcome to the nmap script"

opener2=" 
Avalible commands:
CVE Detection on host: cve
DoS attack on host: dos
Detect malware infection on host: mal
OS Detection scan: os
Syn Port scan: syn
HTTP Enumeration: http-discov
Basic XSS check: basic-xss
Basic SQL Injection check: basic-sql-inject
Basic Wordpress bruteforce: basic-wp-bf
Scans top 1000 ports: top-ports
FTP brute force attack: ftp-bf"



cve() {
    nmap -T$speed -Pn -v --script vuln $host -oN $output
}
dos() {
    nmap $host -T$speed -max-parallelism 800 -Pn --script http-slowloris --script-args http-slowloris.runforever=true -oN $output
}
mal() {
    nmap -p80 -T$speed --script http-google-malware $host -oN $output
}
os() {
    nmap -A -T$speed $host -oN $output
}
syn() {
    nmap -sS -p0- -Pn -A -v -T$speed $host -oN $output
}

http-discov() {
    nmap --script http-enum -sV -v -T$speed $host -oN $output
}

basic-xss() {
    nmap -sV --script -T$speed -v http-unsafe-output-escaping $host -oN $output
}

basic-sql-inject() {
    nmap -sV -T$speed -v --script http-sql-injection $host -oN $output
}

basic-wp-bf() {
    nmap -sV -T$speed -v --script http-wordpress-brute $host -oN $output
}

top-ports() {
    nmap --top-ports 1000 -v -Pn -T$speed $host -oN $output
}

ftp-bf(){
    nmap --script ftp-brute -v -p 21 -T$speed $host -oN $output
}


if [ "${1}" != "--source-only" ]; then
    main "${@}"
fi