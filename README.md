# DockerDumpEpitech
Docker Epitech setup under fedora 30 with blih
Depend on which system you are, you have to follow the proper guide depend on your system.

## Macos

Prerequisite :
Install docker for macos "https://docs.docker.com/docker-for-mac/install/"
Install Xquartz for macos "https://www.xquartz.org/"
Launch XQuartz. Under the XQuartz menu, select Preferences
Go to the security tab and ensure "Allow connections from network clients" is checked, close the application and open it again.
Open a terminal from the Xquartz application and run "xhost +" to allow connection from client host.
Then open a terminal run "cd ~/Documents"
Clone the repository in your document "git clone https://github.com/franciscotco/DockerDumpEpitech.git"
Launch the generation of the sshkey with the command "ssh-keygen" for each question just press enter
Go inside the repository and run "make build" to build the docker on your computer
You could add an alias to connect you directly in the docker when running the command fedora in your terminal run "echo "alias fedora="cd ~/Documents/DockerDumpEpitech && make run"""
Try to run xeyes on your docker

## Linux

