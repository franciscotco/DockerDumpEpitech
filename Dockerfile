FROM epitechcontent/epitest-docker:latest AS epitech-docker

WORKDIR /root/workspace

RUN yum update -y
RUN yum install -y bzip2 SFML emacs
RUN yum install  xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps -y
RUN wget --no-check-certificate http://install.ohmyz.sh -O - | sh

## Download configuration emacs of epitech
RUN git clone https://github.com/Epitech/epitech-emacs.git /tmp/epitech-emacs \
    && cd /tmp/epitech-emacs ; ./INSTALL.sh system

#    && git checkout 1f1ef05d25058e20050612e71578312bee513a5b \

## Download blih
RUN git clone https://github.com/Epitech/dump.git /tmp/dump \
    && chmod 755 /tmp/dump/blih.py ; cp /tmp/dump/blih.py /usr/bin/blih

## Download normez
RUN git clone https://github.com/ronanboiteau/NormEZ.git /tmp/NormEZ \
    && chmod 755 /tmp/NormEZ/NormEZ.rb ; cp /tmp/NormEZ/NormEZ.rb /usr/bin/normez

RUN echo "root:root" | chpasswd
RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN echo "source ~/.zsh/zshalias" >> /root/.zshrc && zsh

COPY ./build_sources/id_rsa.pub /root/.ssh/id_rsa.pub
COPY ./build_sources/id_rsa /root/.ssh/id_rsa
COPY ./build_sources/zshalias /root/.zsh/zshalias
COPY ./build_sources/zshrc_login /root/.zsh/zshrc_login
COPY ./build_sources/bin/hash_passwd.py /usr/bin/login

#RUN echo "source ~/.zsh/zshrc_login" >> /root/.zshrc && zsh

ENV USER_LOGIN="name.last_name@epitech.eu"

RUN git config --global user.email $USER_LOGIN
RUN git config --global user.name $USER_LOGIN
