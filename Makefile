NAME=epitech_container
COMMAND=zsh

#Create or change the common folder on your computer to share file between your docker and your os
MOUNT_FOLDER=~/delivery

build:
	cp ~/.ssh/id_rsa build_sources/id_rsa
	cp ~/.ssh/id_rsa.pub build_sources/id_rsa.pub
	docker build -t $(NAME) .

run:
	docker run -v $(MOUNT_FOLDER):/home/guest/delivery --privileged --user guest -it --rm $(NAME) $(COMMAND)
