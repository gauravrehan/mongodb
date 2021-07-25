# Working with shell and server

#help on starting sever with various params. for xample --port to change the port.
mongod --help

--quiet

# Logs file path
--logpath

# DB folder path
--dbpath


mongod --dbpath ///// --logpath ///////log.log

# fork
--fork

Starts the server process as child process/background process

# How to shutdown a server from commandline (it is tricky to do so if mongodb is started with --fork)

connect to server via shell commandline
use admin
db.shutdownServer()

# Create a config file
mongod.cfg (create it anywhere) and add following:

storage:
  dbPath: "/your/path/to/the/db/folder"
systemLog:
  destination:  file
  path: "/your/path/to/the/logs.log"
  

# Use the config file at startup

sudo mongod -f ///pathtomongoconfigfile




# Shell help
mongosh --help

# Command helps
admin> help
or 
db.help() to get help on db commands
or
dbo.test.help() to get help on collection level commands



