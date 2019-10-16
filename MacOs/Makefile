NAME=epitech_container
COMMAND=zsh

#Create or change the common folder on your computer to share file between the container and your system
MOUNT_FOLDER=~/workspace

# Build your docker image on your system
build:
	docker build -t $(NAME) .

# Connection to the container on Mac
run:
	docker run -it \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	-e DISPLAY=host.docker.internal:0 \
	-v $(MOUNT_FOLDER):/root/workspace \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--rm $(NAME) $(COMMAND)
#	export containerId=$(docker ps -l -q)
