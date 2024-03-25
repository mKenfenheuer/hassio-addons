#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

arguments=$(jq --raw-output '.additional_arguments // empty' $CONFIG_PATH)

echo "${arguments}"

mkdir -p /config/traefik/

traefik --configFile=/etc/traefik/traefik.yaml $arguments