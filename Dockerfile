FROM ubuntu
RUN apt-get update
RUN apt-get install -y apache2 && apt-get install -y systemctl
RUN apt-get install -y vim
RUN systemctl start apache2
RUN systemctl enable apache2
#COPY index.html /var/www/html/
#apt-get install -y  curl 
