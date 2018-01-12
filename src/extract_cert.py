import time

#-------------------------------------------------------------------------------
# create filename with datestamp 
#-------------------------------------------------------------------------------
datestamp =time.strftime("%d-%b-%Y")
filename="cert_"+datestamp+".arm"

#-------------------------------------------------------------------------------
# extract certificate 
#-------------------------------------------------------------------------------
AdminTask.extractCertificate('[-certificateFilePath %s -base64Encoded true -certificateAlias default -keyStoreName CellDefaultKeyStore ]' %filename)
