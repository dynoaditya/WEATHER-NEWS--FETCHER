#!/bin/bash
read -p "Enter city name: " CITY
curl -s "wttr.in/$CITY?format=3"
