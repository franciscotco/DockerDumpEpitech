# DockerDumpEpitech
Docker Epitech pull from offical epitech docker and setup under fedora 30 with blih.

This docker enable the forwarding of graphical flow from the container to your system, that mean you can run graphical application from your container and get a graphical view.

## MacOs

### Prerequisite

1. Install [Docker](https://docs.docker.com/docker-for-mac/install/) on your Mac

2. Install [XQuartz](https://www.xquartz.org/) on your Mac

3. Setup the XQuartz app
    * `Launch the XQuartz application` __&rarr;__ `Under the XQuartz menu` **&rarr;** `Select Preferences`
    * Go to the security tab and ensure `Allow connections from network clients` is checked
    * __Close XQuartz and open it again__.

4. Open a terminal from the XQuartz application and launch the command to enable the connection from any client:
```
xhost + 127.0.0.1
```

### Docker Installation

1. Open a terminal on your Mac and launch:
```
cd ~/Documents
```

2. Clone the repository in your Documents folder:
```
git clone https://github.com/franciscotco/DockerDumpEpitech.git
```

3. Get inside the repository and execute the install script
```
cd DockerDumpEpitech && ./mac_install.sh
```

4. If the script display the success message run the command bellow to build the docker on your computer:
```
make build
```

5. To launch a session on your container go in the repository `DockerDumpEpitech`, launch:
```
make run
```

6. To check if the forwarding of the GUI from the container work launch:
```
xeyes
```

If two eyes follow your mouse that mean it's working

7. To exit the container, launch:
```
exit
```

### Alias
You could add an alias to be connect directly in the docker when running the command `fedora`: 
```
echo "alias fedora="make -C ~/Documents/DockerDumpEpitech run""
```

## Linux

### Prerequisite

1. Install `docker` and `x11-xserver-utils` with your favorite [package manager](https://en.wikipedia.org/wiki/Package_manager) 

2. To enable the connection from any client launch:
```
xhost +
```

### Docker Installation

1. Open a terminal on your Linux and launch:
```
cd ~/Documents
```

2. Clone the repository in your Documents folder:
```
git clone https://github.com/franciscotco/DockerDumpEpitech.git
```

3. Get inside the repository and execute the install script
```
cd DockerDumpEpitech && ./linux_install.sh
```

3. Go inside the repository and run the command bellow to build the docker on your computer:
```
make build
```

4. To launch a session on your container go in the repository `DockerDumpEpitech`, launch:
```
make run
```

5. To exit the container, launch:
```
exit
```

6. To check if the forwarding of the GUI from the container work launch:
```
xeyes
```
