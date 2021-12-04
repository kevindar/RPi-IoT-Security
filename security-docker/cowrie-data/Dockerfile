USER root
RUN apk add --no-cache --upgrade bash
RUN sh -c "find /home/cowrie/cowrie-git/bin -type f -exec sed -i 's/bash/sh/g' {} \;"
RUN chmod a+x /home/cowrie/cowrie-git/bin
COPY ./etc/cowrie.cfg /home/cowrie/cowrie-git/etc/cowrie.cfg
COPY ./etc/userdb.txt /home/cowrie/cowrie-git/etc/userdb.txt
USER cowrie