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
		DIRNAME="$(basename "$(dirname "$0")")"
		echo "DIRNAME='$DIRNAME'" > "$DIRNAMESTORE"
	fi
}

printhelp() {
cat <<EOF

Build project:

	$0 build

Run application:

	$0 run

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

dorun() {
	docker-compose up
}

dopurge() {
	docker-compose rm && docker volume rm "$DIRNAME"_database "$DIRNAME"_web
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

main() {
	local action="$1"; shift
	get_dirname

	case "$action" in
	build)
		dobuild
		;;
	run)
		dorun
		;;
	purge)
		dopurge
		;;
	autorestart)
		doautorestart
		;;
	*)
		printhelp
		;;
	esac
}
