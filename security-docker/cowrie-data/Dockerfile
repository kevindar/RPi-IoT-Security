USER root
RUN apk add --no-cache --upgrade bash
RUN sh -c "find /home/cowrie/cowrie-git/bin -type f -exec sed -i 's/bash/sh/g' {} \;"
USER cowrie