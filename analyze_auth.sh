#!/bin/bash

echo "RAPORT NIEUDANYCH LOGOWAŃ"
echo "========================"

if [ -f /var/log/auth.log ]
then
LOGFILE="/var/log/auth.log"
else
LOGFILE="/var/log/secure"
fi

grep "Failed password" "$LOGFILE" | while read line
do

user=$(echo "$line" | awk '{for(i=1;i<=NF;i++){ if($i=="user") print $(i+1) }}')

ip=$(echo "$line" | awk '{for(i=1;i<=NF;i++){ if($i=="from") print $(i+1)}}')

czas=$(echo "$line" | awk '{print substr($1,1,19)}' | tr 'T' ' ')

liczba=$(grep "$ip" "$LOGFILE" | grep "$user" | grep "Failed password" | wc -l)

hostmap=$(host "$ip" 2>/dev/null | grep "domain name pointer" | awk '{print $5; exit}')

if [ -z "$hostmap" ]
then
hostmap="brak mapowania"
fi

echo "Użytkownik: $user"
echo "Liczba prób: $liczba"
echo "IP atakującego: $ip"
echo "Host: $hostmap"
echo "Czas próby: $czas"
echo "========================"

done
