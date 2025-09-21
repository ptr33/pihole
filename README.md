# pihole
Docker pihole container with auto-restart.

This container uses the standard pihole container ([pihole/pihole](https://github.com/pi-hole/docker-pi-hole)) and only modifies the health check function. 
If the container stops operating, it is automatically killed. If the docker option restart is set, it will be automatically restarted.

Original docker health check:

```docker
HEALTHCHECK CMD dig -p $(pihole-FTL --config dns.port) +short +norecurse +retry=0 @127.0.0.1 pi.hole || exit 1
```

modified to

```docker
HEALTHCHECK --interval=60s CMD dig -p $(pihole-FTL --config dns.port) +short +norecurse +retry=1 @127.0.0.1 pi.hole || kill 1
```
