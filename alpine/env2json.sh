#!/bin/bash
e="${!1}"
if [ ! -z "$e" ]; then
	# env is not blank
	jq --arg x "$1" --arg y "$e" '.[$x] = $y' < settings.json >settings.tmp && mv settings.tmp settings.json
fi
