#!/bin/bash - 
#===============================================================================
#
#          FILE: initial_cert.sh
# 
#         USAGE: ./initial_cert.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: KAUSTAV GANGULI (), write.to.kaustav@gmail.com
#  ORGANIZATION: self
#       CREATED: 01/10/2018 04:00:58 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

source conf.ini

./src/was_script.sh $dmgr_root $username $password get_initial_cert.py


