#!/bin/bash
programHang() {
    if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi
    keypress=''
    while [ "x$keypress" = "x" ]; do
        keypress="`cat -v`"
    done
    if [ -t 0 ]; then stty sane; fi
}
GREEN='\033[1;32m'
RED='\033[1;31m'
WHITE='\033[1;37m'
intro="Welcome to the Time Machine!\n\nTo begin press 1 \nTo cause the machine to 'error out' press 2\nTo stream hexcode repeatedly press 3\nTo review the error press 4\nTo exit press 9\n\nIf 3 is selected then repeatedly press any key to return to this menu.\nEnter Selection: "


while true; do
    clear
    printf "${GREEN}${intro}"
    read userInput
    case $userInput in
        1|start)
            counter="0"
            printf "Initializing..."
            while [ $counter -lt 30 ]
            do
                printf "."
                sleep 0.05
                counter=$[$counter+1]
            done
            counter="0"
            printf "\n\nStarting time travel algorithims...\n"
            sleep 0.5
            SECONDS=0
            while [ $SECONDS -lt 14 ]
            do
                delay=`shuf -i 1-3 -n 1`
                timeout $delay hexdump -C /dev/urandom | GREP_COLOR='1;32' grep --color=auto 'ca fe'
                #counter=$[$counter+1]
            done
            printf "${GREEN}Ready to travel!"
            programHang
            printf "\n"
#           break
        ;;
        3|repeat)
            if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi
            keypress=''
            while [ "x$keypress" = "x" ];do
                delay=`shuf -i 1-5 -n 1`
                timeout $delay hexdump -C /dev/urandom | GREP_COLOR='1;32' grep --color=auto 'ca fe'
                sleep 1
                keypress="`cat -v`"
            done
            if [ -t 0 ]; then stty sane; fi
#           printf "${GREEN}${intro}"
        ;;
        2|error)
            errorCount="0"
            while [ $errorCount -lt 5 ]; do
                printf "${RED}ERROR!!       ERROR!!     ERROR!!\n"
                errorCount=$[errorCount+1]
                sleep 0.05
            done
            SECONDS=0
            printf "${RED}\n"
            while [ $SECONDS -lt 3 ]; do
                lineNo=`shuf -i 1-50 -n 1`'p'
                errorText=`sed -n $lineNo /var/log/syslog`
                printf "${RED}${errorText}"
                sleep 0.03
            printf "${GREEN}\n"
            done
            programHang
#           break
        ;;
        4|"check error")
            printf "${RED}\n"
            sed -n 10,70p /var/log/syslog | less
        ;;
        9|exit)
            echo "Exiting..."
            sleep 0.3
            exit 0
        ;;
        *)
            printf "Invalid input! Please try again: "
        ;;
    esac
done
