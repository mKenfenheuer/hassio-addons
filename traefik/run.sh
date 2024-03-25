#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

arguments=$(jq --raw-output '.additional_arguments // empty' $CONFIG_PATH)

echo "${arguments}"

mkdir -p /config/traefik/file-provider/

if [ ! -f /config/traefik/traefik.yaml ]
then
    echo "Config file does not exist in /config/traefik/traefik.yaml"
    cp /etc/traefik/traefik.yaml /config/traefik/traefik.yaml
fi

traefik --configFile=/config/traefik/traefik.yaml $arguments