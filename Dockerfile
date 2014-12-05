# Version 1.1

FROM crowdriff/baseimage

MAINTAINER Abhinav Ajgaonkar <abhi@crowdriff.com>

# Install Python & PIP
RUN \
    apt-get update; \
    apt-get install -y -qq python; \
    wget -O - http://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz | tar xzf - --strip-components=1 --exclude="README.md" --exclude="LICENSE" --exclude="ChangeLog" -C "/usr/local"; \
    npm install --silent --quiet -g grunt-cli bower forever;

WORKDIR /src;

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
