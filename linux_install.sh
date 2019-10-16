#!/bin/bash

ssh_key=$(find ~/.ssh/ -name "id_rsa")

if test -z "$ssh_key"
then
    echo -e "Not find ssh-key do you want to generate an ssh-key ?\nEnter yes or no"
    read confirm_ssh
    if [ $confirm_ssh = y* ]
    then
	ssh-keygen -t rsa
    else
	echo "Generate an sshkey by yourself and reload the script"
	exit 0
    fi
fi

cp ~/.ssh/id_rsa build_sources/id_rsa
cp ~/.ssh/id_rsa.pub build_sources/id_rsa.pub
chmod 700 build_sources/id_rsa
cp Linux/Makefile .
