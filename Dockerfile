FROM progrium/busybox
MAINTAINER Sunguk Lee <sulee@ea.com>
RUN opkg-install curl && \
    mkdir -p /usr/local/bin && \
    curl -s http://cdist2.perforce.com/perforce/r15.1/bin.linux26x86_64/p4 -o /usr/local/bin/p4 && \
    chmod 755 /usr/local/bin/p4
ENTRYPOINT ["/usr/local/bin/p4"]
