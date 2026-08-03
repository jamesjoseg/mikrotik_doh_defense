# dns-config.rsc
# MikroTik RouterOS v7 - Configuracao DNS + Adlist
# Defense-in-Depth - Camada 2 (Adlist)
# Aplicar com: /import dns-config.rsc

/ip dns
set allow-remote-requests=yes cache-size=16384KiB     servers=1.1.1.1,8.8.8.8

/ip dns adlist
add comment="Bloqueio DoH - dibdot" ssl-verify=no     url="https://raw.githubusercontent.com/dibdot/DoH-IP-blocklists/master/doh-domains_overall.txt"
