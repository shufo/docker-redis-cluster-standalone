FROM redis:3.0-alpine

MAINTAINER shufo

RUN mkdir /src
WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

RUN apk add --update ruby ruby-dev redis && gem install --no-ri --no-rdoc redis

COPY redis-trib.rb /usr/bin/redis-trib.rb
COPY run.sh /run.sh
RUN chmod +x /run.sh

VOLUME ["/data"]

CMD ["/run.sh"]
