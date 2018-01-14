#!/bin/bash - 
#===============================================================================
#
#          FILE: main.sh
# 
#         USAGE: ./main.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: KAUSTAV GANGULI (), write.to.kaustav@gmail.com
#  ORGANIZATION: self
#       CREATED: 01/10/2018 02:13:17 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


#-------------------------------------------------------------------------------
# check if conf.ini exists
#-------------------------------------------------------------------------------
if [ -f conf.ini ];then
	
#-------------------------------------------------------------------------------
# 	clean the conf file - remove spaces
#-------------------------------------------------------------------------------
	sed -i 's/ //g' conf.ini
else

#-------------------------------------------------------------------------------
# 	print how to create conf file & exit the program
#-------------------------------------------------------------------------------
	echo "conf.ini not found"
	printf "create conf.ini file with these details, and in this format\nusername=<username>\npassword=<password>\ndmgr_root=<deployment manager profile location>\nJAVA_HOME=<jre root directory>\n"
	exit 1

fi


#-------------------------------------------------------------------------------
# source config file
#-------------------------------------------------------------------------------
source conf.ini


#-------------------------------------------------------------------------------
# check JAVA_HOME variable in configuration file
#-------------------------------------------------------------------------------
if [ -z ${JAVA_HOME+x} ]; then

	echo "JAVA_HOME is not set"
	exit 1

else
#-------------------------------------------------------------------------------
# check if java file is found (JAVA_HOME is correctly set) 
#-------------------------------------------------------------------------------
	if [ -f $JAVA_HOME/bin/java ];then

#-------------------------------------------------------------------------------
# 		get version number in 2 digit format
#-------------------------------------------------------------------------------
		version=$($JAVA_HOME/bin/java -version 2>&1 | sed -n ';s/.* version "\(.*\)\.\(.*\)\..*"/\1\2/p;')
        
#-------------------------------------------------------------------------------
# 			if java version is less that 1.7 exit the prog
#-------------------------------------------------------------------------------
	        	if [ "$version" -le 16 ];then
        	        	echo "Please install Java 1.7 or newer" 
                		exit 1
        		fi
	
	else

#-------------------------------------------------------------------------------
# JAVA_HOME is not correctly set - exit the program
#-------------------------------------------------------------------------------
		echo "$JAVA_HOME/bin/java not found"
		exit 1

	fi

fi


#-------------------------------------------------------------------------------
# check for $username & $password & $dmgr_root
#-------------------------------------------------------------------------------

if [ -z ${username+x} ]; then

        echo "username is not set"
	echo "add username=<user name for WAS> in conf.ini"
        exit 1
fi

if [ -z ${password+x} ]; then

        echo "password is not set"
	echo "add password=<password for WAS> in conf.ini"
        exit 1

fi

if [ -z ${dmgr_root+x} ]; then

        echo "Deployment Manager location is not set is not set"
	echo "add dmgr_root=<deploymentmanager profile location for WAS> in conf.ini"
        exit 1

fi


#-------------------------------------------------------------------------------
#  check if build folder exists..if not ; then initial run
#-------------------------------------------------------------------------------
if [ -d "build" ] ; then

#-------------------------------------------------------------------------------
# 	the existing cert's fingerprint is saved 
#-------------------------------------------------------------------------------
	./src/check_fingerprint.sh

else

#-------------------------------------------------------------------------------
# 	the program is running for the first time ; create build folder & extract cert fingerprint
#-------------------------------------------------------------------------------

	mkdir build
	./src/initial_cert.sh
fi


