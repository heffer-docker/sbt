ARG JAVA_VERSION=8u192
FROM heffer/openjdk:${JAVA_VERSION}
LABEL maintainer="Sven Reul <sven@heffer.de>"
ARG SBT_VERSION=1.2.7
ADD https://piccolo.link/sbt-${SBT_VERSION}.tgz /tmp/sbt.tgz
RUN apk --no-cache add bash && \
  cd /opt && \
  tar zxvf /tmp/sbt.tgz && \
  rm -f /tmp/sbt.tgz && \
  /opt/sbt/bin/sbt exit && \
  rm -rf /tmp/*
ENV IVY_HOME /opt/ivy2
WORKDIR /opt/build
ENTRYPOINT ["/opt/sbt/bin/sbt", "-ivy", "/opt/ivy2"]
