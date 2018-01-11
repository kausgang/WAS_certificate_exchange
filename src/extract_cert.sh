#!/bin/bash - 
#===============================================================================
#
#          FILE: extract_cert.sh
# 
#         USAGE: ./extract_cert.sh 
# 
#   DESCRIPTION: extract the current certificate from was 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: KAUSTAV GANGULI (), write.to.kaustav@gmail.com
#  ORGANIZATION: self
#       CREATED: 01/11/2018 09:58:51 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

source conf.ini


#-------------------------------------------------------------------------------
# extract the certificate in $dmgr_root/etc
#-------------------------------------------------------------------------------
./src/was_script.sh $dmgr_root $username $password extract_cert.py


#-------------------------------------------------------------------------------
#  move the certificate from $dmgr_root/etc to ./build
#-------------------------------------------------------------------------------
mv $dmgr_root/etc/cert*.arm ./build/
