#!/bin/bash

sudo curlftpfs -o allow_other ftp://10.10.10.1 /rmt/klaus

# It uses .netrc file in home directory,
# The format is:
#    machine ftp.host.com  
#    login myuser  
#    password mypass 

