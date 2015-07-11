#!/bin/bash

sudo rsync -a --stats /rmt/klaus/Pictures/ /home/micio/Pictures/inne/klaus # archive mode with stats
sudo chown -Rv micio:micio /home/micio/Pictures/inne/klaus
sudo chmod -R 700 /home/micio/Pictures/inne/klaus
