#!/bin/bash
cd /home/jenkins/web
pkill -f TechChallengeApp
echo "starting app on port 80"
sudo nohup ./TechChallengeApp serve > /dev/null &
sleep 1
echo "started"
exit