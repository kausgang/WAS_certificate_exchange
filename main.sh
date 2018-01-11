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
# check java version..if >1.7 then continue; else exit
#-------------------------------------------------------------------------------
	version=$($JAVA_HOME/bin/java -version 2>&1 | sed -n ';s/.* version "\(.*\)\.\(.*\)\..*"/\1\2/p;')
	
	if [ "$version" -le 16 ];then
		echo "Please install Java 1.7 or newer" 
		exit 1
	fi

fi


#-------------------------------------------------------------------------------
#  check if build folder exists..if not ; then initial run
#-------------------------------------------------------------------------------
if [ -d "build" ] ; then

	./src/check_fingerprint.sh

else

	mkdir build
	./src/initial_cert.sh
fi


