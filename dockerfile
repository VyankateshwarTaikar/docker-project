FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
ADD https://drive.google.com/file/d/1hnbqe7vJIGTdzZpv741KBWnCYSKpEUeX/view?usp=sharing/avalon.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip avalon.zip
RUN cp -rvf avalon/* .
RUN rm -rf avalon avalon.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80
