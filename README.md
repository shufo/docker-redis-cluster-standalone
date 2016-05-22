# redis-cluster-standalone

A image of redis cluster in stand alone container.
For evaluation purpose or CI use only. Don't use in production.

## Usage

```
docker run -d shufo/redis-cluster-standalone
```

- Specify Port

```
docker run -d -p 7000:7000 -p 7001:7001 -p 7002:7002 -p 7003:7003 -p 7004:7004 -p 7005:7005 -e M1_PORT=7000 -e M2_PORT=7001 -e M3_PORT=7002 -e R1_PORT=7003 -e R2_PORT=7004 -e R3_PORT=7005 shufo/redis-cluster-standalone
```

- Use docker-compose

```
docker-compose up -d
```
