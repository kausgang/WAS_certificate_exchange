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

source conf.ini


if [ -d "build" ] ; then

	./src/check_fingerprint.sh

else

	mkdir build
	./src/initial_cert.sh
fi


