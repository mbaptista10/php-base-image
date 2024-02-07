FROM serversideup/php:beta-8.2-fpm-nginx-alpine

RUN apk --no-cache add \
    libgcc \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    freetype \
    freetype-dev 
    
# RUN cd /tmp/ \
#  && curl -LO "https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php" \
#  && php datadog-setup.php --php-bin=all --enable-appsec --enable-profiling

RUN apk add supervisor \
 && mkdir -p /var/log/supervisor

# RUN install-php-extensions bcmath
# RUN install-php-extensions rdkafka
# RUN install-php-extensions opcache
# RUN install-php-extensions xdebug
# RUN install-php-extensions calendar
# RUN install-php-extensions gd

RUN install-php-extensions bcmath & \
    install-php-extensions rdkafka & \
    install-php-extensions opcache & \
    wait

RUN install-php-extensions xdebug & \
    install-php-extensions calendar & \
    install-php-extensions gd & \
    wait
