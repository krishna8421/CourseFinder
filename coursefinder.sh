# coursefinder v1
# Author = Krishna
# Not the full code, Making the rest of it.
# To Do - 
# Add a torrent Searcher
# Add more site
# Make a database and store everything on it.
# Add torrent downloader
# Work on GUI
# Make the mess clean.

site1=https://www.freecoursesonline.me/
wget -nv  $site1
cat index.html | grep "$site1" | cut -d '"' -f 4 | grep "www" >> dump.txt
cat index.html | grep "$site1" | cut -d '"' -f 6 | grep "www" >> dump.txt
sort dump.txt | uniq > links.txt
rm dump.txt index.html
mkdir logs 
mv links.txt logs/
cd logs
wget -nv -i links.txt
rm links.txt
cat * > ../tmp.txt
cd ..
rm -rf logs/*
mv tmp.txt logs/
cat logs/tmp.txt | grep "$site1" | sort | uniq | cut -d "=" -f 3 | sort | uniq | grep "$site1"| cut -d '"' -f 2 | grep -v "url('h"| grep -v "me/wp-content/"| grep -v "me/wp-includes"| grep -v "me/wp-json/" | grep -v "xmlrpc.php" | grep -v "yoast-schema-graph"| grep -v "me/page" | sort | uniq > logs/tmp_all.txt
cd logs
rm tmp.txt
split -l 150 tmp_all.txt
wget -nv -i xaa
sleep 10;clear
wget -nv -i xab
sleep 10;clear
wget -nv -i xac
sleep 10;clear
wget -nv -i xad
sleep 10;clear
wget -nv -i xae
sleep 10;clear
wget -nv -i xaf
wget -nv -i xag 
wget -nv -i xah
rm tmp_all.txt xaa xab xac xad xae xaf xag xah
cat  * > ../tmp.txt
cd..
rm  logs/*
cat tmp.txt | grep ".torrent" | grep "<p>" | cut -d '"' -f 2 | grep ".torrent" | grep -v "<p>" | sort > results.txt 
clear
