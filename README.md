# TinyRSS with Docker Compose

An excercise using Docker compose to make a TinyRSS installation, and manage it.

## Containers

* Apache + PHP
* PHP + cron
* MySQL data
* letencrypt

## Build

Run the build on each directory in containers:

	bash ./build-all.sh

Notably, the `tinyrss-web` step will take a while on the clone job, be patient !
