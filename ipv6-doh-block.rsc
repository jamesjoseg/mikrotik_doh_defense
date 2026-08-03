# ipv6-doh-block.rsc
# MikroTik RouterOS v7 - Bloqueio de DoH/DoT IPv6
# Defense-in-Depth - Camada 3 (Firewall IPv6)
# Aplicar com: /import ipv6-doh-block.rsc

/ipv6 firewall address-list
add address=2606:4700:4700::1111 comment="DoH Cloudflare Primary IPv6" list=DoH_IPs_IPv6
add address=2606:4700:4700::1001 comment="DoH Cloudflare Secondary IPv6" list=DoH_IPs_IPv6
add address=2001:4860:4860::8888 comment="DoH Google Primary IPv6" list=DoH_IPs_IPv6
add address=2001:4860:4860::8844 comment="DoH Google Secondary IPv6" list=DoH_IPs_IPv6
add address=2620:fe::fe comment="DoH Quad9 IPv6" list=DoH_IPs_IPv6
add address=2a10:50c0::ad1:ff comment="DoH AdGuard Primary IPv6" list=DoH_IPs_IPv6
add address=2a10:50c0::ad2:ff comment="DoH AdGuard Secondary IPv6" list=DoH_IPs_IPv6
add address=2620:119:35::35 comment="DoH OpenDNS Primary IPv6" list=DoH_IPs_IPv6
add address=2620:119:53::53 comment="DoH OpenDNS Secondary IPv6" list=DoH_IPs_IPv6
add address=2a07:a8c0:: comment="DoH NextDNS IPv6" list=DoH_IPs_IPv6

/ipv6 firewall filter
add action=reject chain=forward comment="Bloqueia DoH IPv6 (443)"     dst-address-list=DoH_IPs_IPv6 dst-port=443 protocol=tcp reject-with=tcp-reset
add action=reject chain=forward comment="Bloqueia DoT IPv6 (853)"     dst-address-list=DoH_IPs_IPv6 dst-port=853 protocol=tcp reject-with=tcp-reset

/ipv6 firewall nat
add action=redirect chain=dstnat comment="FORCAR-DNS IPv6: Intercepta UDP"     dst-port=53 protocol=udp to-ports=53
add action=redirect chain=dstnat comment="FORCAR-DNS IPv6: Intercepta TCP"     dst-port=53 protocol=tcp to-ports=53
