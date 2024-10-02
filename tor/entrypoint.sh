#!/bin/sh
set -e

# Change local user id and group
usermod -u 1000 alice
groupmod -g 1000 alice

# Set correct owners on volumes
chown -R tor:alice /var/lib/tor
chown -R :alice /etc/tor
chown -R alice:alice /home/alice

sudo -u tor /usr/bin/tor &
socat tcp4-LISTEN:802,reuseaddr,fork,keepalive SOCKS4A:127.0.0.1:4t4jxmivv6uqej6xzx2jx3fxh75gtt65v3szjoqmc4ugdlhipzdat6yd.onion:80,socksport=9050 &
socat tcp4-LISTEN:801,reuseaddr,fork,keepalive SOCKS4A:127.0.0.1:ghbtv7lhoyhomyir4xvxaeyqgx4ylxksia343jaat3njqqlkqpdjqcyd.onion:80,socksport=9050