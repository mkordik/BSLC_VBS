#!/bin/bash
GREEN='\033[1;32m'
intro="Welcome to the Time Machine!\nto begin enter 'start' \nto exit enter 'exit' \nto stream hexcode enter 'repeat' \n\nIf repeat is selected then repeatedly press any key to return to this menu.\nEnter Selection: "

printf "${GREEN}${intro}"

while [ 1 -eq 1 ]
do
    read userInput
    if [ $userInput == "start" ]; then
        #echo $userInput
        counter="0"
        echo "Initializing..."
        sleep 1
        while [ $counter -lt 30 ]
            do
            printf "."
            #echo "......................................................................................."
            sleep 0.15
            counter=$[$counter+1]
        done
        counter="0"
        printf "\n\nStarting time travel algorithims...\n"
        sleep 1

        while [ $counter -lt 2 ]
        do
            delay=`shuf -i 1-3 -n 1`
            timeout $delay hexdump -C /dev/urandom | GREP_COLOR='1;32' grep --color=auto 'ca fe'
            counter=$[$counter+1]
        done
        printf "${GREEN}Ready to travel!\n"
        break
    elif [ $userInput == "repeat" ]; then
	if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi
	count=0
	keypress=''
	while [ "x$keypress" = "x" ];do
		delay=`shuf -i 1-5 -n 1`
		timeout $delay hexdump -C /dev/urandom | GREP_COLOR='1;32' grep --color=auto 'ca fe'
		sleep 1
		keypress="`cat -v`"
	done
	if [ -t 0 ]; then stty sane; fi
	printf "${GREEN}${intro}"
	#printf "Please enter option selection: "
    elif [ $userInput == "exit" ]; then
        echo "Exiting..."
        sleep 1
        exit 0
    else printf "Invalid input! Please try again: "
    fi
done
