# TinyRSS with Docker Compose

An excercise using Docker Compose to make a TinyRSS installation, and manage it.

## Containers

* Apache + PHP
* PHP + cron
* MySQL data
* letencrypt

## Usage

Edit `environment-vars` and adjust the passwords as required ; also ensure that the desired domain name is added for certbot

The following script performs the build, creation and execution of services.

	./run.sh build

Notably, the `tinyrss-web` step will take a while on the `git-clone` job, be patient !

Start and stop the containers:

	./run.sh start
	./run.sh stop

You can now go to [http://localhost/](http://localhost/) to configure the application

The database host is `db`, the rest is as configured in the `environment-vars` file.
