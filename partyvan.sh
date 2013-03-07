#!/bin/bash

# partyvan.sh
# Just loop through the 28 pages of the kusaba shit, grab the WAV URLs and save them.
# If the page numbers change that will probably need to be changed.
# joseph.hare@gmail.com

if [-f partyvanfiles.txt]
then
    rm -rf partyvanfiles.txt
fi

for i in {1..28}
do
    curl "http://www.4chanpartyvan.net/kusaba/spam/$i.html" | grep -Eo '/kusaba/spam/src/[0-9a-zA-Z_]*\.wav' | awk '{print "http://www.4chanpartyvan.net" $1}' >> partyvanfiles.txt
done

cat partyvanfiles.txt | uniq -u > partyvanfiles.txt

while read l; do
    wget $l
done < partyvanfiles.txt

rm -rf partyvanfiles.txt
