#!/usr/bin/env python
# encoding: utf-8
 
# install dependencies: sudo pip install validate_email pyDNS

# run it:	python check.py file.csv
#		python check py file.txt

# FYI, forwarding addresses (not catchalls) will report 'probably not valid'. that's all i've got right now.

# Original Script created by Neal Shyam → https://gist.github.com/nealrs/6722656

 
import sys
from validate_email import validate_email 
 
# define name, domain, and initials parameters
mailsFile = sys.argv[1]
 
# add a splash of color
HEAD = '\033[95m'
OK = '\033[92m'
WARN = '\033[93m'
FAIL = '\033[91m'
ENDC = '\033[0m'
 
# run validation logic
print HEAD+"Checking..."+ENDC
with open(mailsFile) as fileLines:
	for line in fileLines:
		x = line.rstrip('\r\n')
		has_mx = validate_email(x,check_mx=True)
		is_real = validate_email(x,verify=True)
 
		if (has_mx != True):
			print x+" "+FAIL+": no mx record"+ENDC
		else:
			if is_real:
				print x+" : "+OK+"probably valid"+ENDC
			else:
				print x+" : probably not valid"
print HEAD+"Done"+ENDC