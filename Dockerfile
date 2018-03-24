FROM openjdk:8-jre

RUN groupadd -g 1001 madsonic
RUN useradd -u 1001 -g 1001 madsonic

RUN mkdir -p /var/madsonic
RUN mkdir -p /var/media
RUN mkdir -p /var/media/artists
RUN mkdir -p /var/media/incoming
RUN mkdir -p /var/media/podcast
RUN mkdir -p /var/media/playlists/import
RUN mkdir -p /var/media/playlists/export
RUN mkdir -p /var/media/playlists/backup


RUN chown -R madsonic:madsonic /var/madsonic 
RUN chown -R madsonic:madsonic /var/media


RUN wget -O /var/madsonic/madsonic.tar.gz http://madsonic.org/download/6.2/20161222_madsonic-6.2.9080-standalone.tar.gz

RUN tar xvf /var/madsonic/madsonic.tar.gz -C /var/madsonic

COPY madsonic.sh /var/madsonic/madsonic.sh
RUN chmod +x /var/madsonic/madsonic.sh

USER madsonic 
EXPOSE 4040 

ENTRYPOINT ["/var/madsonic/madsonic.sh"]
