#!/bin/bash

# Valós publikus IP-k különböző országokból
IPS=(
    "185.220.101.45"   # Németország - Tor exit node
    "103.149.28.195"   # Kína
    "91.240.118.172"   # Oroszország
    "197.210.84.18"    # Nigéria
    "45.227.255.206"   # Brazília
    "193.32.162.45"    # Hollandia
    "222.186.180.130"  # Kína
    "178.128.23.9"     # Szingapúr
)

USERNAMES=("root" "admin" "ubuntu" "test" "oracle")

echo "Injecting fake brute force attempts with real public IPs..."

for ip in "${IPS[@]}"; do
    for user in "${USERNAMES[@]}"; do
        echo "$(date '+%b %e %H:%M:%S') elk sshd[$$]: Failed password for invalid user $user from $ip port $((RANDOM + 1024)) ssh2" >> /var/log/auth.log
        echo "$(date '+%b %e %H:%M:%S') elk sshd[$$]: Invalid user $user from $ip port $((RANDOM + 1024))" >> /var/log/auth.log
    done
    echo "Injected attacks from: $ip"
done

echo ""
echo "Done! Waiting for Filebeat to pick up the logs..."
sleep 10
echo "Check Kibana at http://$(hostname -I | awk '{print $1}'):5601"
