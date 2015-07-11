#!/bin/bash

sudo rsync --delete -a --stats ex@s3.mydevil.net:~/backup/*.gz /home/micio/Documents/backup/mydevil/ # delete extraneous files from dest, archive mode
sudo chown -Rv micio:micio /home/micio/Documents/backup/mydevil/*
