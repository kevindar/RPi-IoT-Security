USER root
RUN apk add --no-cache --upgrade bash
RUN sh -c "find /home/cowrie/cowrie-git/bin -type f -exec sed -i 's/bash/sh/g' {} \;"
COPY cowrie-data/etc/cowrie.cfg /home/cowrie/cowrie-git/etc/cowrie.cfg
COPY cowrie-data/etc/userdb.txt /home/cowrie/cowrie-git/etc/userdb.txt
RUN chmod a+x /home/cowrie/cowrie-git/bin
RUN chown -R cowrie:cowire /home/cowrie/cowrie-git
USER cowrie