
#!/bin/bash
read -p "Enter topic: " TOPIC
URL="https://news.google.com/rss/search?q=$TOPIC&hl=en-IN&gl=IN&ceid=IN:en"
RAW=$(curl -s "$URL")

echo "Top News on: $TOPIC"
echo "$RAW" \
| grep -o "<title>[^<]*</title>" \
| sed 's/<title>//;s/<\/title>//' \
| sed '1d' \
| head -5
