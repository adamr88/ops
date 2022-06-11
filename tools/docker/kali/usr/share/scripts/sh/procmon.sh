#!/bin/bash

IFS=$'\n'

old_process=$(ps -eo command)

while true; do
	sleep .3
	new_process=$(ps -eo command)
	diff <(echo "$old_process") <(echo "$new_process")
	old_process="$new_process"
done
