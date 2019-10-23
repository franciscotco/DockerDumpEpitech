#!/usr/bin/env python3
import hashlib
import os
#import sys
import getpass
#import subprocess

file_path = "~/.zsh/zshrc_login"
login = input("Enter your login: ")
cmd = 'echo "export BLIH_USER=\"' + login + '\"" > ' + file_path
os.system(cmd)
#subprocess.call(cmd, shell=True)
passwd = hashlib.sha512(bytes(getpass.getpass(), 'utf8')).hexdigest()
cmd = 'echo "export BLIH_TOKEN=\"' + passwd + '\"" >> ' + file_path
os.system(cmd)
cmd = 'source ~/.zsh/zshrc_login; zsh -i'
os.system(cmd)

