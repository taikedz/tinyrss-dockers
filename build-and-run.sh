#!/bin/bash

has_bin() {
	which "$1" >/dev/null 2>&1
}

faile() {
	echo "$*"
	exit 1
}

has_bin docker-compose || faile "Please install docker-compose"

docker-compose build  || faile "Build failed"
docker-compose create || faile "(Re-)Creation of containers failed"
docker-compose up


