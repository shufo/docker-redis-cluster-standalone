#!/bin/sh

M1_PORT=${M1_PORT:-7000}
M2_PORT=${M2_PORT:-7001}
M3_PORT=${M3_PORT:-7002}
R1_PORT=${R1_PORT:-7003}
R2_PORT=${R2_PORT:-7004}
R3_PORT=${R3_PORT:-7005}

OPTIONS="--cluster-enabled yes"
OPTIONS="${OPTIONS} --cluster-config-file nodes.conf"
OPTIONS="${OPTIONS} --cluster-node-timeout 5000"
OPTIONS="${OPTIONS} --appendonly yes"
OPTIONS="${OPTIONS} --daemonize yes"

mkdir /data/m1 && /usr/local/bin/redis-server --port ${M1_PORT} --dir /data/m1 ${OPTIONS}  
mkdir /data/m2 && /usr/local/bin/redis-server --port ${M2_PORT} --dir /data/m2 ${OPTIONS} 
mkdir /data/m3 && /usr/local/bin/redis-server --port ${M3_PORT} --dir /data/m3 ${OPTIONS} 
mkdir /data/r1 && /usr/local/bin/redis-server --port ${R1_PORT} --dir /data/r1 ${OPTIONS} 
mkdir /data/r2 && /usr/local/bin/redis-server --port ${R2_PORT} --dir /data/r2 ${OPTIONS} 
mkdir /data/r3 && /usr/local/bin/redis-server --port ${R3_PORT} --dir /data/r3 ${OPTIONS} 

IP=${IP:-127.0.0.1}
LOG_FILE=/redis-cluster.log

printf 'yes' | ruby /usr/bin/redis-trib.rb create --replicas 1 ${IP}:${M1_PORT} ${IP}:${M2_PORT} ${IP}:${M3_PORT} ${IP}:${R1_PORT} ${IP}:${R2_PORT} ${IP}:${R3_PORT} >> ${LOG_FILE} 
tail -f ${LOG_FILE}
