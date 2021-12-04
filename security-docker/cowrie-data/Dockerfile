USER root
RUN apk add --no-cache --upgrade bash
RUN sh -c "find /home/cowrie/cowrie-git/bin -type f -exec sed -i 's/bash/sh/g' {} \;"
RUN chmod a+x /home/cowrie/cowrie-git/bin
RUN chown -R cowrie:cowire /home/cowrie/cowrie-git
USER cowrie