ARG SCALA_VERSION=2.12.8
FROM heffer/scala:${SCALA_VERSION}
LABEL maintainer="Sven Reul <sven@heffer.de>"
ARG SBT_VERSION=1.2.7
ADD https://piccolo.link/sbt-${SBT_VERSION}.tgz /tmp/sbt.tgz
RUN cd /opt && \
  tar zxvf /tmp/sbt.tgz && \
  rm -f /tmp/sbt.tgz && \
  /opt/sbt/bin/sbt exit && \
  rm -rf /tmp/*
ENTRYPOINT ["/opt/sbt/bin/sbt"]
