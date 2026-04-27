FROM pihole/pihole:2026.04.1

HEALTHCHECK --interval=60s CMD dig -p $(pihole-FTL --config dns.port) +short +norecurse +retry=1 @127.0.0.1 pi.hole || kill 1
