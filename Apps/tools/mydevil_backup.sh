#!/bin/bash

sudo rsync --delete -a --stats ex@s3.mydevil.net:~/backup/*.gz /home/miciek/Documents/backup/mydevil/ # delete extraneous files from dest, archive mode
sudo chown -Rv miciek:miciek /home/miciek/Documents/backup/mydevil/*
