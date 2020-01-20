FROM centos:6 

#redeploy from nginx to httpd
RUN yum install git httpd -y

#old init equivalent of systemd unit file creation
WORKDIR /etc/init.d
RUN chkconfig --add httpd 
RUN chkconfig httpd on

WORKDIR /home/deploy
RUN git clone https://github.com/linuxacademy/content-dockerquest-spacebones.git

WORKDIR /home/deploy/content-dockerquest-spacebones/doge
RUN cp ./doge.gif ./index.html ./sabgstars1.jpg /var/www/html/

RUN apachectl start #start the service

CMD ["-D", "FOREGROUND"]

#cannot be over-ridden unlike CMD
ENTRYPOINT ["httpd"] 

