FROM ubuntu:vivid
MAINTAINER Sunguk Lee <sulee@ea.com>
RUN apt-get update && apt-get install -y curl fontconfig vim-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8 && \
    mkdir -p /usr/share/fonts/otf && \
    curl -L https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf -o /usr/share/fonts/otf/PowerlineSymbols.otf && \
    curl -L https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf -o /usr/share/fonts/otf/10-powerline-symbols.conf && \
    fc-cache -vf /usr/share/fonts/otf && \
    mkdir -p /usr/local/bin && \
    curl -s http://cdist2.perforce.com/perforce/r15.1/bin.linux26x86_64/p4 -o /usr/local/bin/p4 && \
    chmod 755 /usr/local/bin/p4
ENTRYPOINT ["/usr/local/bin/p4"]
