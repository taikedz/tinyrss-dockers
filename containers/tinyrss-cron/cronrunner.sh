#!/bin/bash

if [[ ! -f /cron.log ]]; then
	touch /cron.log
	chown www-data:www-data /cron.log
fi

cron && tail -f /cron.log
