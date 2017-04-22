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


#sudo systemctl disable gpsd.socket
#sudo systemctl stop gpsd.service

#Next, configure gpsd by modifying the contents of /etc/default/gpsd:
#START_DAEMON="true"
#USBAUTO="false"
#DEVICES="/dev/ttyS4"
#GPSD_OPTIONS="-n"
#(The -n option tells gpsd to talk to the GPS receiver right away, rather than waiting for a client to connect.)
#Finally, edit the service definition in /lib/systemd/system/gpsd.service. We want to comment out the "Requires" and "Also" lines referring to gpsd.socket, and add a new "WantedBy" line for multi-user.target. The resulting file should look like this:
#[Unit]
#Description=GPS (Global Positioning System) Daemon
##Requires=gpsd.socket

#[Service]
#EnvironmentFile=-/etc/default/gpsd
#ExecStart=/usr/sbin/gpsd -N $GPSD_OPTIONS $DEVICES

#[Install]
##Also=gpsd.socket
#WantedBy=multi-user.target
#After that, run:

#sudo systemctl start gpsd.service

#That should start gpsd. It should also be started automatically at boot time (when systemd tries to launch "multi-user.target"). Try running the cgps command; it should show you a display with reasonable time, latitude and longitude values, and a status of "3D FIX". Press 'q' to quit.



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



echo ""
echo ""
echo "MAKING CODE AUTOSTART"
echo "--------------------------------------------------------------"
echo ""


#sudo nano /etc/rc.local
#Scroll to the bottom and add the following line :

#python /home/pi/myscript.py &
#where “/home/pi/myscript.py” is the path to your script.
#before end

#Type “Ctrl+X” to exit, then “Y” to save followed by “Enter” twice.

#make python cript executable  #!/usr/bin/python at the very start of your file. Then make it executable with chmod +x filename





#todo
#make executable using, sudo chmod +x install_script.sh
#test above using, sh install_script.sh
#download code from github using curl
#put code in raspberry startup so that it autostarts
