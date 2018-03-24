FROM openjdk:8-jre

RUN groupadd -g 1001 madsonic
RUN useradd -m -u 1001 -g 1001 madsonic

RUN mkdir -p /var/madsonic
RUN mkdir -p /var/music
RUN mkdir -p /var/media
RUN mkdir -p /var/media/artists
RUN mkdir -p /var/media/incoming
RUN mkdir -p /var/media/podcast
RUN mkdir -p /var/media/playlists/import
RUN mkdir -p /var/media/playlists/export
RUN mkdir -p /var/media/playlists/backup


RUN chown -R madsonic:madsonic /var/madsonic 
RUN chown -R madsonic:madsonic /var/media
RUN chown -R madsonic:madsonic /var/music

USER madsonic

RUN mkdir -p $HOME/madsonic
RUN wget -O $HOME/madsonic/madsonic.tar.gz http://madsonic.org/download/6.2/20161222_madsonic-6.2.9080-standalone.tar.gz

RUN tar xvf $HOME/madsonic/madsonic.tar.gz -C $HOME/madsonic

COPY madsonic.sh /home/madsonic/madsonic/madsonic.sh

EXPOSE 4040
