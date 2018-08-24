From debian:jessie
MAINTAINER Timothée Eid <timothee.eid@erizo.fr>

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

EXPOSE 9000

# Install packages
RUN apt-get update && apt-get install -y \
	php5-fpm \
&& rm -rf /var/lib/apt/lists/*

# Initialize default FPM conf
RUN rm -f /etc/php5/fpm/pool.d/*
ADD pool.d/www.conf /etc/php5/fpm/pool.d/www.conf

# Setup startup script
CMD ["php5-fpm",  "--nodaemonize", "--force-stderr", "--fpm-config", "/etc/php5/fpm/php-fpm.conf", "-c", "/etc/php5/fpm/php.ini"]
