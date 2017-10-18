#!/bin/bash

has_bin() {
	which "$1" >/dev/null 2>&1
}

faile() {
	echo "$*"
	exit 1
}

DIRNAMESTORE=./.dirname

get_dirname() {
	if [[ -f "$DIRNAMESTORE" ]]; then
		. "$DIRNAMESTORE"
	else
		DIRNAME="$(basename "$PWD" | sed -r 's/[^a-zA-Z0-9]+//g')"
		echo "DIRNAME='$DIRNAME'" > "$DIRNAMESTORE"
	fi
}

printhelp() {
cat <<EOF

Build/rebuild images and containers:

	$0 build

Start/stop application:

	$0 start
	$0 stop

Delete containers:

	$0 rm

Delete data:

	$0 purge

Set auto-restart status:

	$0 auto {start | stop}

EOF
}

has_bin docker-compose || faile "Please install docker-compose"

dobuild() {
	docker-compose build  || faile "Build failed"
	docker-compose create || faile "(Re-)Creation of containers failed"
}

dopurge() {
	dorm
	docker volume rm "$DIRNAME"_{web,database}
}

dorm() {
	docker-compose down
	docker-compose rm || faile "Could not remove containers"
}

doautorestart() {
	case "$1" in
	start)
		docker update --restart=unless-stopped "${DIRNAME}"_{web,db}_1
		;;
	stop)
		docker update --restart=never "${DIRNAME}"_{web,db}_1
		;;
	*)
		printhelp
	esac
}

dostop() {
	docker-compose down
}

dostart() {
	docker-compose up -d
}

main() {
	local action="$1"; shift
	get_dirname

	case "$action" in
	build)
		dobuild
		;;
	rm)
		dorm
		;;
	purge)
		dopurge
		;;
	autorestart)
		doautorestart
		;;
	start)
		dostart
		;;
	stop)
		dostop
		;;
	*)
		printhelp
		;;
	esac
}

main "$@"
