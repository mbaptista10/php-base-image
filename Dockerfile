FROM serversideup/php:beta-8.3-cli-alpine

RUN apk --no-cache add \
    libgcc \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    freetype \
    freetype-dev 
    
RUN apk --no-cache add supervisor \
 && mkdir -p /var/log/supervisor

RUN install-php-extensions rdkafka gd xdebug
