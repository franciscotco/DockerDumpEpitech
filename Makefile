NAME=epitech_container
COMMAND=zsh

#Create or change the common folder on your computer to share file between the container and your system
MOUNT_FOLDER=~/delivery

build:
	cp ~/.ssh/id_rsa build_sources/id_rsa
	cp ~/.ssh/id_rsa.pub build_sources/id_rsa.pub
	docker build -t $(NAME) .

# Run docker on linux
run_linux:
	docker run -it \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	-v $(MOUNT_FOLDER):/root/workspace \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--rm $(NAME) $(COMMAND)
#	export containerId=$(docker ps -l -q)
# Run docker on Mac
run:
	docker run -it \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	-e DISPLAY=host.docker.internal:0 \
	-v $(MOUNT_FOLDER):/root/workspace \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--rm $(NAME) $(COMMAND)
	export containerId=$(docker ps -l -q)
