#!/bin/bash - 
#===============================================================================
#
#          FILE: check_fingerprint.sh
# 
#         USAGE: ./check_fingerprint.sh 
# 
#   DESCRIPTION: compare current cert fingerprint with the old cert fingerprint 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: KAUSTAV GANGULI (), write.to.kaustav@gmail.com
#  ORGANIZATION: self
#       CREATED: 01/10/2018 03:51:32 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

source ./build/existing_cert_details
source conf.ini

./src/was_script.sh $dmgr_root $username $password get_current_cert.py

source ./build/current_cert_details

echo "$fingerprint"
echo "$current_fingerprint"

#tampering current_fingerprint to execute else condition
current_fingerprint=${current_fingerprint:2}

echo "$current_fingerprint" 

if [ "$fingerprint" = "$current_fingerprint" ];then
	
	echo match
else 
	echo no_match
fi

rm ./build/current_cert_details

