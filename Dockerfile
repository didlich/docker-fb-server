
FROM alpine-jruby

MAINTAINER didlich@t-online.de


RUN apk update \
    && apk add nginx \
    && rm -rf /var/cache/apk/*

# setup nginx configuration
# will copy content of nginx
ADD nginx /etc/nginx/

RUN mkdir /etc/nginx/sites-enabled \
    && ln -s /etc/nginx/sites-available/elasticsearch /etc/nginx/sites-enabled/elasticsearch

# Specify Volume
VOLUME ["/home/user/git"]

# Add files
COPY docker-entrypoint.sh /

# CMD
#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/docker-entrypoint.sh"]