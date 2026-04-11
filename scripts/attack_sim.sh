#!/bin/bash

USERNAMES=("admin" "root" "test" "oracle" "ubuntu" "deploy" "git" "jenkins" "nagios" "user")
PASSWORDS=("password" "123456" "admin" "letmein" "qwerty")

echo "Starting SSH brute force simulation..."
echo "Target: localhost"
echo ""

for user in "${USERNAMES[@]}"; do
    for pass in "${PASSWORDS[@]}"; do
        sshpass -p "$pass" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=2 "$user@localhost" 2>/dev/null
    done
    echo "Tried user: $user"
done

echo ""
echo "Simulation done. Checking auth.log..."
echo ""
grep "Failed password\|Invalid user" /var/log/auth.log | tail -20
