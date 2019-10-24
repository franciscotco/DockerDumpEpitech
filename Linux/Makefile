NAME=epitech_container
COMMAND=zsh

#Create or change the variable MOUNT_FOLDER on your computer to share file between the container and your system
MOUNT_FOLDER=~/workspace

#Build your docker image
build:
	docker build -t $(NAME) .

# Run docker on linux
run:
	xhost + 127.0.0.1
	docker run -it \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	-v $(MOUNT_FOLDER):/root/workspace \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--rm $(NAME) $(COMMAND)
	xhost - 127.0.0.1
#	export containerId=$(docker ps -l -q)
