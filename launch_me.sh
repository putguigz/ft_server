#!/bin/zsh

red=$'\033[0;31m'
reset=$'\033[0;39m'

if [ "$(docker images | grep bonjourmonde | cut -d ' ' -f 1)" != "bonjourmonde" -o "$1" = "re" ]
then
	echo "container will now ${red}build${reset}"
	sleep 2
	echo "Building"
	docker build -t bonjourmonde .
else
	echo "container already build. ${red}running will now start.${reset}"
	sleep 2
fi

docker run -it -p 80:80 -p 443:443 -e AUTOINDEX=ON --rm --name server bonjourmonde
