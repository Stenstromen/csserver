# CSserver

Based on https://dev.to/flatmango/counter-strike-16-dedicated-server-part-1-basic-setup-33lf

## Example docker run
```
docker run -d --rm -p 27015:27015/tcp -p 27015:27015/udp -v $PWD/csserver.cfg:/home/csserver/lgsm/config-lgsm/csserver/csserver.cfg csserver:latest
```