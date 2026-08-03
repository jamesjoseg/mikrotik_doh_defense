# nat-dns-redirect.rsc
# MikroTik RouterOS v7 - Redirect DNS porta 53
# Defense-in-Depth - Camada 1 (Interceptacao)
# Aplicar com: /import nat-dns-redirect.rsc

/ip firewall nat
add action=redirect chain=dstnat comment="FORCAR-DNS IPv4: Intercepta UDP"     dst-port=53 protocol=udp to-ports=53
add action=redirect chain=dstnat comment="FORCAR-DNS IPv4: Intercepta TCP"     dst-port=53 protocol=tcp to-ports=53
