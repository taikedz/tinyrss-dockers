#!/bin/bash

touch /root/cron.log

cron && tail -f /root/cron.log
