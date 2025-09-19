FROM pihole/pihole:2025.08.0

HEALTHCHECK --interval=60s CMD dig -p $(pihole-FTL --config dns.port) +short +norecurse +retry=1 @127.0.0.1 pi.hole || exit 1
