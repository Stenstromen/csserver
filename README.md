# CSserver

Based on https://dev.to/flatmango/counter-strike-16-dedicated-server-part-1-basic-setup-33lf

## Example docker run
```
docker run -d --rm \
-p 27015:27015/tcp \
-p 27015:27015/udp \
-e MAP="cs_assault" \
-e MAXPLAYERS="16" \
 csserver:latest
```

# Random Notes

```
# https://www.joe.to/cstrike/ents/command_line_options.html
./hlds_run -game cstrike \
-nointro \
-nojoy \
-noipx \
-heapsize 64000 \
-strictportbind \
+ip 0.0.0.0 \
-port 27015 \
+clientport 27005 \
+map cs_office \
+servercfgfile csserver.cfg \
-maxplayers 16 \
2> /dev/null
```