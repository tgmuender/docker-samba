FROM blitznote/debootstrap-amd64:16.04

RUN apt-get -y update\
        && apt-get -y install samba

COPY run.sh /run.sh
RUN chmod u+x /run.sh

EXPOSE 445 137 138 139

ENTRYPOINT ["/run.sh"]
CMD ["-h"]
