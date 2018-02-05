# WAS_certificate_exchange
#### run this program with
./main.sh

    1.  When the script runs for the first time
        a.  Create a build folder
        b.  Extract current certificate’s fingerprint and expiry date into ./build/existing_cert_details
    2.  In subsequent runs the script 
        a.  Checks if build folder exists
            i.  If no
                1.	Treat it as first time run
                2.	Go to step 1
            ii.	If yes
                1.	Extract fingerprint of current WAS certificate
                2.	Compare the extracted certificate’s fingerprint with the one present in ./build/extracted_cert_details
                3.	If match found – certificate has not expired ; exit the program
                4.	If no match
                    a.	Extract the current certificate in cert_<datestamp>.arm 
                    b.	Take backup of destination keystore file
                    c.	Import the arm into certificate keystore file
                    d.	Update ./build/extracted_cert_details with the current certificate’s fingerprint
                    e.	Notify certificate update status with mail

