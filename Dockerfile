FROM openjdk:11-jre-slim

WORKDIR /apps

# install scouter
COPY ./scouter-all-2.18.0-SNAPSHOT.tar.gz ./scouter-all.tar.gz
RUN tar xvfz ./scouter-all.tar.gz -C ./

# COPY scouter server conf
COPY ./conf/server/scouter.conf ./scouter/server/conf/scouter.conf

# install scouter alter plugin
COPY ./plugin/alert-slack/ ./scouter/server/lib/

# run scouter collector server
WORKDIR /apps/scouter/server
CMD java -Xmx1024m -classpath ./scouter-server-boot.jar scouter.boot.Boot ./lib
