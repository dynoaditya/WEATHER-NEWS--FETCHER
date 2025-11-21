#!/bin/bash

fetch_news() {
    read -p "Enter topic: " TOPIC
    if [[ -z "$TOPIC" ]]; then
        echo "Topic cannot be empty!"
        return
    fi

    URL="https://news.google.com/rss/search?q=$TOPIC&hl=en-IN&gl=IN&ceid=IN:en"
    RAW=$(curl -s "$URL")

    echo ""
    echo "==============================="
    echo "   Top News on: $TOPIC"
    echo "==============================="
    echo ""

    echo "$RAW" \
        | grep -o "<title>[^<]*</title>" \
        | sed 's/<title>//;s/<\/title>//' \
        | sed '1d' \
        | head -5
    echo ""
}

fetch_weather() {
    read -p "Enter city name: " CITY
    if [[ -z "$CITY" ]]; then
        echo "City cannot be empty!"
        return
    fi

    echo ""
    echo "==============================="
    echo "   Weather for: $CITY"
    echo "==============================="
    echo ""

    curl -s "https://wttr.in/$CITY?0"
    echo ""
}

show_about() {
    echo ""
    echo "-----------------------------"
    echo "  Weather/News Fetcher is a lightweight Unix command-line tool that retrieves real-time weather information and the latest news" 
    echo "  headlines using shell scripting and public APIs. Built for speed, simplicity, and easy integration into terminal workflows."
    echo "   
    echo "-----------------------------"
    echo ""
}

while true; do
    echo "====================================="
    echo "                MENU"
    echo "====================================="
    echo "1. Fetch News"
    echo "2. Fetch Weather"
    echo "3. About"
    echo "4. Exit"
    echo "-------------------------------------"
    read -p "Enter your choice: " CHOICE

    case $CHOICE in
        1) fetch_news ;;
        2) fetch_weather ;;
        3) show_about ;;
        4) 
            echo "Exiting... Goodbye!"
            exit 0
            ;;
        *) echo "Invalid option, try again!" ;;
    esac

    echo ""
done



