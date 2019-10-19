import hashlib
import os
import sys
import getpass
import subprocess
import codecs

#print (len(sys.argv))
#if len(sys.argv) < 2:
#    print("Enter your login: \"name.last_name@epitech.eu\"")
#    exit(84);
#login = input("Enter your login: ")
login = "francois.moine@epitech.eu"
cmd = 'echo "export BLIH_USER=\"' + login + '\"" > ~/.bashrc_login'
#print(cmd)
print (cmd)
subprocess.call(cmd, shell=True)
#print("Enter your password :")
truc = "bbeT}T4L"
passwd = hashlib.sha512(bytes(truc, 'utf8')).hexdigest()
cmd = 'echo "export BLIH_TOKEN=\"' + passwd + '\"" >> ~/.bashrc_login'
print (cmd)
subprocess.call(cmd, shell=True)
cmd = "blih repository list"
#result = subprocess.call(cmd, stdout=subprocess.PIPE, shell=True)
result = os.popen(cmd).read()
print (result)
#test =  "moine_f"

#msg = "PTY allocation request failed on channel 0\nConnection to git.epitech.eu closed.\n\nHi moine_f! You've successfully authenticated,\nbut I do not provide interactive shell access.\n\n"
#print (result)
#print ("\n\n")
#print (msg)

#if msg == result:
#    print("sucessfull logged as " + login)

#my_cmd = os.popen(command).read()

#passwd = getpass.getpass().encode()
#hash = bytes(passwd, 'utf8')
#store =  hash.decode('utf8')
#store =  hash.decode('utf8')
#cmd = 'echo ' + store + ''
#codecs.encode(passwd, encoding='utf-8', errors='strict')
#os.environ['TUTU'] = sys.argv[1]
#os.environ['BLIH_TOKEN'] = passwd
#cmd = 'echo "export BLIH_TOKEN=$\'' + passwd + '\'" >> .bashrc'
#print(cmd)
#subprocess.call(cmd, shell=True)
#os.system(hash)
#exit(0)
#myCmd = 'echo "export BLIH_TOKEN=\"' + str(hash) + '\" >> .bashrc'
#print(myCmd)
#os.system(myCmd)

