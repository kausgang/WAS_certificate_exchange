import time

#-------------------------------------------------------------------------------
# get the cell certificate details
#-------------------------------------------------------------------------------
x= AdminTask.getCertificate('[-certificateAlias default -keyStoreName CellDefaultKeyStore]')

#-------------------------------------------------------------------------------
# find the expiry date
#-------------------------------------------------------------------------------

#find the valid from text
start = x.find("Valid from",0,len(x))
#find the dot at end of text
end = x.rfind(".",0,len(x))
#slice the text & extract needed string
y = x[start:end]

#find the end date
start = y.find("to",0,len(y))
end = len(y)
end_date = y[start+3:end]

final_date = end_date.replace(",","")

#print final_date


#-------------------------------------------------------------------------------
# get fingerprint value
#-------------------------------------------------------------------------------
start = x.find("fingerPrint",0,len(x))
#print start
y = x[start:len(x)]
#print y
end = x.find("]",start,len(x))
#print end
z= x[start:end]
#print z

start = z.find(" ",0,len(z))


fingerprint = z[start+1:len(z)]

#-------------------------------------------------------------------------------
# write the content into ./build/existing_cert_details
#-------------------------------------------------------------------------------
f = open("build/existing_cert_details","w+")
f.write("fingerprint=\"%s\"\nexpiry=\"%s\"" %(fingerprint,final_date))
f.close()



