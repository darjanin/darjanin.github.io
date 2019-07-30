#!/usr/bin/env bash

mount-websupport.sh && rsync -avz --progress ./ ~/Documents/Websupport/milandarjanin.com/web/ && umount-websupport.sh