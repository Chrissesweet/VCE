#! /usr/bin/python
# Written by Chistian Elawad, April 2017
 
import os
from gps import *
from time import *
import time
import threading
import MySQLdb
from papirus import PapirusTextPos

##########################################################################################

 
gpsd = None #seting the global variable
 
os.system('clear') #clear the terminal (optional)
 
class GpsPoller(threading.Thread):
  def __init__(self):
    threading.Thread.__init__(self)
    global gpsd #bring it in scope
    gpsd = gps(mode=WATCH_ENABLE) #starting the stream of info
    self.current_value = None
    self.running = True #setting the thread running to true
 
  def run(self):
    global gpsd
    while gpsp.running:
      gpsd.next() #this will continue to loop and grab EACH set of gpsd info to clear the buffer
 
if __name__ == '__main__':
  gpsp = GpsPoller() # create the thread
  try:
    gpsp.start() # start it up
    while True:
      #It may take a second or two to get good data
      #print gpsd.fix.latitude,', ',gpsd.fix.longitude,'  Time: ',gpsd.utc
      
      
      
      ##########################################################################################
      # DATABASE

      print
      print 
      print '----------------------------------------'

      # Open database connection
      db = MySQLdb.connect(host="172.20.10.5", user="root", passwd="", db="VolvoCE")

      # prepare a cursor object using cursor() method
      cursor = db.cursor()

      # Prepare SQL query to INSERT a record into the database.
      sql = "INSERT INTO tag(id, latitud, longitud, type, ammount) \
             VALUES ('%s', '%s', '%s', '%s', '%s' )" % \
             ('1', gpsd.fix.latitude, gpsd.fix.longitude, 'Bricks', '20ton')
      sql += " ON DUPLICATE KEY UPDATE latitud='%s', longitud='%s', type='%s', ammount='%s'" % \
             (gpsd.fix.latitude, gpsd.fix.longitude, 'Bricks', '20ton')
      
      print sql
      
      try:
         # Execute the SQL command
         cursor.execute(sql)
         # Commit your changes in the database
         db.commit()
         print 
         print 'Upload to database successful'
      except:
         # Rollback in case there is any error
         db.rollback()

      # disconnect from server
      db.close()

      ##########################################################################################
      # eINC DISPLAY


      # Calling PapirusTextPos this way will mean nothing is written to the screen be default
      text = PapirusTextPos(False)
      
      # Clear all text from the screen
      # This does a full update so is a little slower than just removing the text.
      text.clear()

      # Write text to the screen at selected point, with an Id
      # Nothing will show on the screen
      text.AddText("Order id: ", 10, 10, Id="OrderId" )
      text.AddText("Owner: ", 10, 30, Id="Owner" )
      text.AddText("Type: ", 10, 50, Id="Type")
      text.AddText("Ammount: ", 10, 70, Id="Ammount")

      # Now display lines on the scrren
      text.WriteAll()



      ##########################################################################################
      # Command line
      # (will be removed or commented out later)

 
      os.system('clear')
 
      print
      print ' GPS reading'
      print '----------------------------------------'
      print 'latitude    ' , gpsd.fix.latitude
      print 'longitude   ' , gpsd.fix.longitude
      print 'time utc    ' , gpsd.utc,' + ', gpsd.fix.time
      print 'altitude (m)' , gpsd.fix.altitude
      print 'eps         ' , gpsd.fix.eps
      print 'epx         ' , gpsd.fix.epx
      print 'epv         ' , gpsd.fix.epv
      print 'ept         ' , gpsd.fix.ept
      print 'speed (m/s) ' , gpsd.fix.speed
      print 'climb       ' , gpsd.fix.climb
      print 'track       ' , gpsd.fix.track
      print 'mode        ' , gpsd.fix.mode
      print
      # print 'sats        ' , gpsd.satellites
      
      ##########################################################################################
 
      time.sleep(20) #set to whatever
 
  except (KeyboardInterrupt, SystemExit): #when you press ctrl+c
    print "\nKilling Thread..."
    gpsp.running = False
    gpsp.join() # wait for the thread to finish what it's doing
  print "Done.\nExiting."
