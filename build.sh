#!/bin/bash

if [ ! $1 ]; then
	echo " Example of use: source build.sh production"
fi

if [ $1 ]; then
	cd /home/woojou/public_html/chat
	source ./build-info.sh
	export METEOR_SETTINGS=$(cat settings.$1.json)
	meteor build --server http://chat.woojou.com:3000 --directory /home/woojou/public_html/chat_bundle
	cd /home/woojou/public_html/chat_bundle/programs/server
	npm install
	cd /home/woojou/public_html/chat
	pm2 startOrRestart /home/woojou/public_html/chat/pm2.$1.json
fi
