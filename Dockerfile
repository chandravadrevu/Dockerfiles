FROM ubuntu:latest

LABEL maintainer="Chandra Vadrevu xxxxxxxxxxxxxxx"
ENV DEBIAN_FRONTEND noninteractive
# Install basics:
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y vim && apt-get install -y software-properties-common && apt-get install -y language-pack-en-base && \
LC_ALL=en_US.UTF-8  add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y curl
# Install PHP 5.6:
RUN apt-get update
RUN apt-get install -y php-common libapache2-mod-php5.6 php5.6-mysql php5.6-mbstring php5.6-gd php5.6-curl php5.6-mcrypt php5.6-xdebug php5.6-dom
RUN apt-get install -y imagemagick && apt-get install -y gcc php5.6-imagick
# Manually set up the apache environment variables:
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Expose apache:
EXPOSE 80 443 3306 8080 8983
