#!/bin/bash -e
# CourseFinder v2
# This is a tool to download many paid courses.
# Not the full code, Making the rest of it.
# We use 2 sites to download - https://www.freecoursesonline.me & https://desirecourse.net Visit them to find mode courses.
# Author = Krishna Kumar
# To Do -
# Add more Site
# Add a torrent Downloader
# Make a better GUI


CYAN="\e[36m"
MAGENTA="\e[35m"
GREEN="\e[32m"
banner(){
	clear
	echo -e $CYAN '
 ____ ____ _    ____ ____ _____   ______ _     ____ _________ 
/   _/  _ / \ //  __/ ___/  __/  /    / / \  //  _ /  __/  __\
|  / | / \| | ||  \/|    |  \    |  __| | |\ || | \|  \ |  \/|
|  \_| \_/| \_/|    \___ |  /_   | |  | | | \|| |_/|  /_|    /
\____\____\____\_/\_\____\____\  \_/  \_\_/  \\____\____\_/\_\
                                       
                                    Version = v2
                                    Author = Krishna Kumar
                                    Github = github.com/krishna8421                                                              
'
}

banner
echo -e $MAGENTA '\n ~>> Hey, This tool will grab you torrent files of all the available Course\n'
echo -e $MAGENTA '~>> This will take 100-200mb and 5-10mins\n'
echo -e $MAGENTA '~>> Get a coffee and Relax!\n'
read -p ' ~>> Start(Y/N): '  input

main(){
	echo -ne $GREEN " [#                                                  ]\r"
	wget -nv  https://www.freecoursesonline.me/ > /dev/null 2>&1
	cat index.html | grep "https://www.freecoursesonline.me/courses" | cut -d '"' -f 4 | grep "www" >> dump.txt
	cat index.html | grep "https://www.freecoursesonline.me/courses" | cut -d '"' -f 6 | grep "www" >> dump.txt
	sort dump.txt | uniq > links.txt
	echo -ne $GREEN " [###                                                ]\r"
	rm dump.txt index.html
	mkdir logs 
	echo -ne $GREEN " [#####                                              ]\r"
	mv links.txt logs/
	cd logs
	wget -nv -i links.txt > /dev/null 2>&1
	echo -ne $GREEN " [########                                           ]\r"
	rm links.txt
	cat * > ../tmp.txt
	cd ..
	rm -rf logs/*
	mv tmp.txt logs/
	echo -ne $GREEN " [############                                       ]\r"
	cat logs/tmp.txt | grep "https://www.freecoursesonline.me/" | sort | uniq | cut -d "=" -f 3 | sort | uniq | grep "https://www.freecoursesonline.me"| cut -d '"' -f 2 | grep -v "url('h"| grep -v "me/wp-content/"| grep -v "me/wp-includes"| grep -v "me/wp-json/" | grep -v "xmlrpc.php" | grep -v "yoast-schema-graph"| grep -v "me/page" | sort | uniq > logs/tmp_all.txt
	cd logs
	rm tmp.txt
	echo -ne $GREEN " [#############                                      ]\r"
	split -l 150 tmp_all.txt
	wget -nv -i xaa > /dev/null 2>&1
	sleep 10
	echo -ne $GREEN " [#################                                  ]\r" 
	wget -nv -i xab > /dev/null 2>&1
	sleep 10
	echo -ne $GREEN " [#######################                            ]\r"
	wget -nv -i xac > /dev/null 2>&1
	sleep 10
	echo -ne $GREEN " [##########################                         ]\r"
	wget -nv -i xad > /dev/null 2>&1
	sleep 10
	echo -ne $GREEN " [#############################                      ]\r"
	wget -nv -i xae > /dev/null 2>&1
	sleep 10
	echo -ne $GREEN " [###############################                    ]\r"
	wget -nv -i xaf > /dev/null 2>&1
	wget -nv -i xag > /dev/null 2>&1
	wget -nv -i xah > /dev/null 2>&1
	wget -nv -i xai > /dev/null 2>&1
	echo -ne $GREEN " [#################################                  ]\r"
	rm tmp_all.txt xaa xab xac xad xae xaf xag xah > /dev/null 2>&1
	cat  * > ../tmp.txt
	cd ..
	rm  -rf logs
	mkdir Results
	echo -ne $GREEN " [#######################################            ]\r"
	cat tmp.txt | grep ".torrent" | grep "<p>" | cut -d '"' -f 2 | grep ".torrent" | grep -v "<p>" | sort > Results/.results.txt
	rm tmp.txt
	cd Results
	echo -ne $GREEN " [##############################################     ]\r"
	wget -nv -i .results.txt > /dev/null 2>&1
	rm .results.txt
	rename  "FreeCoursesOnline.Me-" "" *
	rename  "FreeCoursesOnline.Us-" "" *
	rename  "FreeTutorials.Eu-" "" *
	rename  "[FreeCoursesOnline.Me]" "" *
	rename  "FCO-" "" *
	echo -ne $GREEN " [###################################################]\r"
}

#spin(){
#	i=1
#	sp="/-\|"
#	echo -n ' ' 
#	while true
#	do
#		printf "\b${sp:i++%${#sp}:1}"
#	done
#}

if [[ "$input" != "${input#[Nn]}" ]]; then
	echo -e "\n ~>> Tata"
	exit 
else 
	banner
	echo -e '\n   [+]Getting the Links'
#	spin & main  
	main
	banner
fi 

echo -e "~>> All Cources are Stored in Results Folder, ENJOY :)\n"

#MarCus
