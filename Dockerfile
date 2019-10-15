FROM epitechcontent/epitest-docker:latest AS epitech-docker

WORKDIR /root/workspace

RUN yum update -y
RUN yum install -y bzip2 SFML emacs
RUN yum install  xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps -y
RUN wget --no-check-certificate http://install.ohmyz.sh -O - | sh

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

RUN git clone https://github.com/ronanboiteau/NormEZ.git \
    && cd NormEZ \
    && chmod 755 NormEZ.rb && cp NormEZ.rb /usr/bin/moulinette \
    && cd .. && rm -rf NormEZ

RUN echo "root:root" | chpasswd
RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN echo "source alias" >> /root/.zshrc && zsh

COPY ./build_sources/id_rsa.pub /root/.ssh/id_rsa.pub
COPY ./build_sources/id_rsa /root/.ssh/id_rsa
COPY ./build_sources/alias /root/alias
COPY ./build_sources/bin/blih /usr/bin/blih
COPY ./build_sources/bin/blih /bin/blih

## Enter env login ex name.last_name@epitech.eu
ENV BLIH_USER="francois.moine@epitech.eu"
ENV BLIH_TOKEN="bbeT}T4L"

RUN git config --global user.email $BLIH_USER
RUN git config --global user.name $BLIH_USER