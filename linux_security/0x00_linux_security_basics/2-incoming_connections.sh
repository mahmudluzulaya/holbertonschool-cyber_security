#!/bin/bash
# Run as privileged user
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp -j DROP
sudo ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo ip6tables -A INPUT -p tcp -j DROP
echo "Rules updated"
echo "Rules updated (v6)"
