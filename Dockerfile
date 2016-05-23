FROM redis:3.0-alpine

MAINTAINER shufo

RUN mkdir /src
WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

RUN apk add --update ruby ruby-dev redis && gem install --no-ri --no-rdoc redis

COPY redis-trib.rb /usr/bin/redis-trib.rb
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENV M1_PORT=$M1_PORT \
    M2_PORT=$M2_PORT \
    M3_PORT=$M3_PORT \
    R1_PORT=$R1_PORT \
    R2_PORT=$R2_PORT \
    R3_PORT=$R3_PORT

EXPOSE $M1_PORT \
       $M2_PORT \
       $M3_PORT \
       $R1_PORT \
       $R2_PORT \
       $R3_PORT

VOLUME ["/data"]

CMD ["/run.sh"]
