#!/bin/zsh

red=$'\033[0;31m'
reset=$'\033[0;39m'

if [ "$1" = "rmi" ]
then
	docker rmi -f bonjourmonde:latest
fi

if [ "$(docker images | grep bonjourmonde | cut -d ' ' -f 1)" != "bonjourmonde" ]
then
	echo "container will now ${red}build${reset}"
	sleep 2
	echo "Building"
	docker build -t bonjourmonde .
else
	echo "container already build. ${red}running will now start.${reset}"
	sleep 2
fi

if [ "$1" = "-it" -o "$2" = "-it" ]
then	
	docker run -it -p 80:80 --rm --name server bonjourmonde
elif [ "$1" = "-d" -o "$2" = "-d" ]
then	
	docker run -d -p 80:80 --rm --name server bonjourmonde
else 
	docker run -it -p 80:80 --rm --name server bonjourmonde
fi 
