#!/bin/bash

#This is a web scraping script for subdomains of a website
#Author: Coker Jonathan
#version: 1.10
#Name: Getisub


url=$1
output="output.txt"

function check_website(){
    curl -o $output https://crt.sh/?q=$url
    check_errors
}

function strip_site(){
    grep "<TD>" $output | sed 's/<[^>]*>//g' | cut -d "=" -f 1 | sort | uniq > $url.txt
}

function check_errors(){
    [ $? -ne 0 ] && echo "Error loading page..." && exit -1
}

########################################
#             Main Section             #
########################################
ehco "***********************"
echo "*       Getisub       *"
echo "*       v. 1.10       *"
echo "***********************"
check_website
strip_site

rm output.txt