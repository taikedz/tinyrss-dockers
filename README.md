# TinyRSS with Docker Compose

An excercise using Docker compose to make a TinyRSS installation, and manage it.

## Containers

* Apache + PHP
* PHP + cron
* MySQL data
* letencrypt

## Usage

Edit `containers/tinyrss-mariadb/environment-vars` and adjust the passwords as required

The following script performs the build, creation and execution of services.

	bash ./build-and-run.sh

Notably, the `tinyrss-web` step will take a while on the `git-clone` job, be patient !

You can now go to [http://localhost/](http://localhost/) to configure the application

The database host is `db`, the rest is as configured in the `environment-vars` file previously mentioned.
