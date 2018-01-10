#!/bin/bash - 
#===============================================================================
#
#          FILE: initial_run.sh
# 
#         USAGE: ./initial_run.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: KAUSTAV GANGULI (), write.to.kaustav@gmail.com
#  ORGANIZATION: self
#       CREATED: 01/10/2018 02:09:13 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

$1/bin/wsadmin.sh -username $2 -password $3 -lang jython -f ./src/$4

