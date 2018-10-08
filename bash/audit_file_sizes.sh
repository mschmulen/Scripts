#!/bin/sh

pwd;

echo "Audit file sizes"

FILE_DEFAULT_LEGEND=Homer/UnitTests/Legend-default.json;
FILESIZEINGB=$(du -h "$FILE_DEFAULT_LEGEND" | awk '{print $1}')
echo "$FILE_DEFAULT_LEGEND is $FILESIZEINGB ."

# Finally
echo "🏁"

