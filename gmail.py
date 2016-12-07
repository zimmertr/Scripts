#####################################################################
#####################################################################
##gmail.py is a python script used to query gmail to determine the ##
##number of unread emails in my Gmail account. This script is      ##
##loaded by my Conky application so that I can always tell how many##
##unread emails I have from my desktop.                            ##
#####################################################################
#####################################################################

import urllib.request
from xml.etree import ElementTree as etree
 
#Use Google's API to log into my account.
auth_handler = urllib.request.HTTPBasicAuthHandler()
auth_handler.add_password(realm='mail.google.com',
                          uri='https://mail.google.com/',
                          user= 'email',
                          passwd= 'password')
opener = urllib.request.build_opener(auth_handler)
urllib.request.install_opener(opener)
 
#Determine the number of unread emails
gmail = 'https://mail.google.com/gmail/feed/atom'
NS = '{http://purl.org/atom/ns#}'
with urllib.request.urlopen(gmail) as source:
    tree = etree.parse(source)
fullcount = tree.find(NS + 'fullcount').text
 
#Print the number of unread emails.
print(fullcount)
