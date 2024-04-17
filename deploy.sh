#!/bin/bash

# SSH command to connect to the server
ssh ubuntu@192.168.64.6 << EOF

# Change directory to the web root
cd /var/www/jenkins

# Pull the latest changes from the main branch
git pull origin main

EOF