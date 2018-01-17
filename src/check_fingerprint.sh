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


#-------------------------------------------------------------------------------
# get the previous $fingerprint vale
#-------------------------------------------------------------------------------
source ./build/existing_cert_details
#-------------------------------------------------------------------------------
# get details from configuration file
#-------------------------------------------------------------------------------
source conf.ini


#-------------------------------------------------------------------------------
# get the $current_fingerprint from WAS & save it in ./build/current_cert_details 
#-------------------------------------------------------------------------------
./src/was_script.sh $dmgr_root $username $password get_current_cert.py



#-------------------------------------------------------------------------------
# get $current_fingerprint
#-------------------------------------------------------------------------------
source ./build/current_cert_details

#-------------------------------------------------------------------------------
# check if the current_fingerprint matches with the saved one
#-------------------------------------------------------------------------------
if [ "$fingerprint" = "$current_fingerprint" ];then
	
	echo match
else 

#-------------------------------------------------------------------------------
# if the fingerprint doesn't match .. extract the certificate
#-------------------------------------------------------------------------------
#	echo no_match
	./src/extract_cert.sh


#-------------------------------------------------------------------------------
# ENTER CODE TO IMPORT THE CERTIFICATE INTO KEYSTORE HERE
#-------------------------------------------------------------------------------

	#read keystore file location & keystore password by sourcing the conf.ini file
	#backup keystore database file
	#$JAVA_HOME/bin/keytool -importcert -trustcacerts -alias <ALIAS NAME WITH DATE STAMP> -file <EXPORTED CERT ARM FILE> -keystore <KEYSTORE FILE> -storepass <KEYSTORE PASSWORD>
	#notify by mail
	#update ./build/existing_cert_details with new fingerprint


fi


#-------------------------------------------------------------------------------
# remove the temporary ./build/current_cert_details
#-------------------------------------------------------------------------------
rm ./build/current_cert_details

