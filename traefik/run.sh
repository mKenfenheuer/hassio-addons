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

for row in $(jq -r '.env_vars[] | @base64' $CONFIG_PATH); do
    _jq() {
     echo ${row} | base64 -d | jq -r ${1}
    }
   name=$(_jq '.name')
   value=$(_jq '.value')
   export $name=$value
   echo $name=$value
done

traefik --configFile=/config/traefik/traefik.yaml $arguments