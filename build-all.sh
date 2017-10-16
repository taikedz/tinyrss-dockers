#!/bin/bash

has_bin() {
	which "$1" >/dev/null 2>&1
}

faile() {
	echo "$*"
	exit 1
}

has_bin docker || faile "Please install docker"
has_bin docker-compose || faile "Please install docker-compose"

failures=0

for containerdir in containers/* ; do
	(
	cd "$containerdir"
	cname="$(basename $containerdir)"
	docker build -t "$cname" . || faile "Failed to build $cname"
	) || failures="$((failures + 1))"
done

[[ "$failures" = 0 ]] || faile "$failures failed image builds !"
