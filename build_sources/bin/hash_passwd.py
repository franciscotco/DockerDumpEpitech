#!/usr/bin/env python3
import hashlib
import os
#import sys
import getpass
#import subprocess

file_path = "~/.zsh/zshrc_login"
login = input("Enter your login: ")
passwd = hashlib.sha512(bytes(getpass.getpass(), 'utf8')).hexdigest()

os.environ['BLIH_USER'] = login;
os.environ['BLIH_TOKEN'] = passwd;
cmd = 'blih repository list'
is_connect = os.popen(cmd).read()

if is_connect.find('Bad token') != -1:
    print("Fail to connect bad token, Retry !")
    exit(84)
else:
    print("Success full connected as " + login)

cmd = 'echo "export BLIH_USER=\"' + login + '\"" > ' + file_path
os.system(cmd)
cmd = 'echo "export BLIH_TOKEN=\"' + passwd + '\"" >> ' + file_path
os.system(cmd)
cmd = 'echo "source ~/.zsh/zshrc_login" >> ~/.zshrc ; zsh -i'
os.system(cmd)
