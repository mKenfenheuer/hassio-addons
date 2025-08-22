FROM traefik:v3.5

COPY traefik.yaml /etc/traefik/traefik.yaml

COPY run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

RUN apk update && apk upgrade && apk add bash jq

CMD [ "/usr/bin/run.sh" ]
