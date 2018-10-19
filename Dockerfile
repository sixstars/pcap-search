FROM ubuntu:16.04
RUN sed -i 's/archive.ubuntu.com/ftp.sjtu.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    python2.7 python2.7-dev python-pip\
    libpcap-dev \
    bc \
    inotify-tools \
    ruby \
    ruby-dev \
    nodejs \
    npm \
    locales \
    psmisc \
    zsh \
    git

RUN locale-gen en_US.UTF-8 && \
    pip install dpkt pypcap && \
    gem install sinatra sinatra-contrib tilt sass slim coffee-script && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    npm i -g bower

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

COPY ./pcap-search-docker /root/pcap-search/
WORKDIR /root/pcap-search/web/
RUN bower i --allow-root && \
    chmod +x /root/pcap-search/start && \
    make -C /root/pcap-search/
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /mnt/pcap
EXPOSE 4568
CMD ["/root/pcap-search/start"]
