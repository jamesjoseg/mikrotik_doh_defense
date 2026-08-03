# ipv4-doh-block.rsc
# MikroTik RouterOS v7 - Bloqueio de DoH/DoT IPv4
# Defense-in-Depth - Camada 3 (Firewall)
# Aplicar com: /import ipv4-doh-block.rsc

/ip firewall address-list
add address=1.1.1.1 comment="DoH Cloudflare Primary" list=DoH_IPs
add address=1.0.0.1 comment="DoH Cloudflare Secondary" list=DoH_IPs
add address=8.8.8.8 comment="DoH Google Primary" list=DoH_IPs
add address=8.8.4.4 comment="DoH Google Secondary" list=DoH_IPs
add address=9.9.9.9 comment="DoH Quad9" list=DoH_IPs
add address=94.140.14.14 comment="DoH AdGuard Primary" list=DoH_IPs
add address=94.140.15.15 comment="DoH AdGuard Secondary" list=DoH_IPs
add address=208.67.222.222 comment="DoH OpenDNS Primary" list=DoH_IPs
add address=208.67.220.220 comment="DoH OpenDNS Secondary" list=DoH_IPs
add address=45.90.28.0 comment="DoH NextDNS" list=DoH_IPs

/ip firewall filter
add action=reject chain=forward comment="Bloqueia DoH IPv4 (443) - avisa cliente"     dst-address-list=DoH_IPs dst-port=443 protocol=tcp reject-with=tcp-reset
add action=reject chain=forward comment="Bloqueia DoT IPv4 (853) - avisa cliente"     dst-address-list=DoH_IPs dst-port=853 protocol=tcp reject-with=tcp-reset
