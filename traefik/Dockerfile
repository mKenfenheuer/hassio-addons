FROM traefik:v2.10

COPY traefik.yaml /etc/traefik/traefik.yaml
COPY run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh
RUN apk update && apk upgrade && apk add bash

CMD [ "/usr/bin/run.sh" ]
