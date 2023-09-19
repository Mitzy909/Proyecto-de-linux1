#!/bin/bash

echo "          ----------------------"
echo "         |     Fecha y hora     |"
echo "          ----------------------"



hora=$(cat /proc/driver/rtc | grep "rtc_time" | sed 's/rtc_time[ \t]*:[ \t]*//')
echo "La hora es: ($hora)"

fecha=$(cat /proc/driver/rtc| grep "rtc_date"| sed 's/rtc_date[ \t]*:[ \t]*//')

echo "La fecha es: ($fecha)"