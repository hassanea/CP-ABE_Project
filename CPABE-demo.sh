#!/bin/bash

# Created by:  Evan Hassan
# CSI-4480 Project


# Start timer

START=$(date +%s)

echo "This is a demo of CP-ABE (cpabe)"

echo "Generating a private key for Bob along with a set of attributes..."

# Generation of Private key and a set of attributes for Bob

cpabe-keygen -o bob_priv_key pub_key master_key \

echo "Attributes added: Attribute 1 - 10 or Att_1 - 10"

echo "test.txt file is to be encrypted and output.txt contains the resulting hidden message from test.txt"

# Encryption of test.txt with given policy

cpabe-enc pub_key test.txt 'Att_10'

echo "Policy: Att_10"

# Decryption of test.txt.cpabe

cpabe-dec pub_key bob_priv_key test.txt.cpabe

echo "test.txt now decrypted!"

echo "Contents of the text file revealed!"

# Redirects text file contents to output.txt

less test.txt > output.txt

less output.txt

# End timer

END=$(date +%s)

DIFF=$(( $END - $START ))

echo "It took $DIFF seconds to execute"
