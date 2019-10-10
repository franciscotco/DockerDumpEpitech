FROM epitechcontent/epitest-docker:latest AS epitech-docker

WORKDIR /home/guest/delivery

COPY ./build_sources/bin/* /usr/bin/

COPY ./build_sources/id_rsa.pub /home/guest/.ssh/id_rsa.pub
COPY ./build_sources/id_rsa /home/guest/.ssh/id_rsa

RUN yum update -y
RUN yum install -y bzip2 SFML emacs
RUN wget --no-check-certificate http://install.ohmyz.sh -O - | sh
RUN useradd -r -g wheel guest
RUN echo "guest:root" | chpasswd

## configure emacs for epitech
RUN git clone https://github.com/Epitech/epitech-emacs.git \
    && cd epitech-emacs \
    && git checkout 1f1ef05d25058e20050612e71578312bee513a5b \
    && ./INSTALL.sh system \
    && cd .. && rm -rf epitech-emacs

## Download blih
RUN git clone https://github.com/Epitech/dump.git \
    && cd dump \
    && chmod 755 blih.py && cp blih.py /usr/bin/blih \
    && cd .. && rm -rf dump

## Enter env login ex name.last_name@epitech.eu
ENV LOGIN name.last_name@epitech.eu

RUN git config --global user.email $LOGIN
RUN git config --global user.name $LOGIN