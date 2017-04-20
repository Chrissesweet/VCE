#!/bin/bash

#  install_script.sh
#  
#
#  Created by Christian Elawad on 2017-04-20.
#


echo ""
echo "INSTALLING PaPiRus 2.0 ePaper/eInc Screen"
echo ""

# Run this line and PaPiRus will be setup and installed
curl -sSL https://pisupp.ly/papiruscode | sudo bash

# Write data to the screen
papirus-write "Test"

echo ""
echo ""
echo "INSTALLING PaPiRus 2.0 ePaper/eInc Screen Done"
echo "--------------------------------------------------------------"
echo ""



echo ""
echo "INSTALLING gpsd"
echo ""

sudo apt-get update
sudo apt-get install gpsd gpsd-clients python-gps

echo ""
echo ""
echo "INSTALLING gpsd Done"
echo "--------------------------------------------------------------"
echo ""


echo ""
echo "INSTALLING MySQL"
echo ""

sudo apt-get install mysql-client
sudo apt-get install python-mysqldb

echo ""
echo ""
echo "INSTALLING MYSQL Done"
echo "--------------------------------------------------------------"
echo ""

#todo
#make executable using, sudo chmod +x install_script.sh
#test above using, sh install_script.sh
#download code from github using curl
#put code in raspberry startup so that it autostarts
