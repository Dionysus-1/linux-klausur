#!/bin/bash

echo "delete user"
userdel -r malte 2>/dev/null
userdel -r amir 2>/dev/null
userdel -r selin 2>/dev/null
sleep 1

echo "remove homes"
rm -rf /home/malte /home/amir /home/selin
rm -rf /srv/halle
sleep 1

echo "remove groups"
groupdel empfang 2>/dev/null
groupdel hotel 2>/dev/null
sleep 1
