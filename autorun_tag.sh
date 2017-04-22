#!/bin/bash

#  autorun_tag.sh
#  
#
#  Created by Christian Elawad on 2017-04-21.
#

sudo systemctl start gpsd.service

sudo python gpsdData.py

