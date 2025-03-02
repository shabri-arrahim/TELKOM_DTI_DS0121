# Using this awesopme prebuild image:
FROM '123majumundur/php-7.1-nginx:cicd'
MAINTAINER Shabri <shabriarr@gmail.com>

# Make directory for hosting the apps
RUN mkdir /home/app/app
WORKDIR /home/app/app

# Install dependencies
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /home/app/.composer

# Copy code base
COPY --chown=app:root . ./


# Finish composer
# RUN composer dump-autoload
RUN composer dump-autoload --no-scripts --no-dev --optimize

EXPOSE 8080