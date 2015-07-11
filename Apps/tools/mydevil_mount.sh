#!/bin/bash

sudo sshfs -o ro -o allow_other -o IdentityFile=~/.ssh/id_rsa ex@s3.mydevil.net:/home/ex/ /rmt/mydevil
