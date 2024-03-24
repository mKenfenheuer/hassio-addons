#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

#USERNAME=$(jq --raw-output '.username // empty' $CONFIG_PATH)

#echo "${USERNAME}""

mkdir -p /config/traefik/

traefik --configFile=/etc/traefik/traefik.yaml