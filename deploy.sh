# !/bin/bash

ssh ubuntu@192.168.64.6 << EOF

cd /var/www/jenkis

git pull origin main

EOF