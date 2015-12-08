FROM ubuntu:14.04
MAINTAINER Ray "https://github.com/ccxiaor"

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

VOLUME /var/www/volume01
EXPOSE 22
EXPOSE 80

CMD    ["/usr/sbin/sshd", "-D"]
