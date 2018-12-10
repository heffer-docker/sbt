FROM heffer/openjdk:8u192
LABEL maintainer="Sven Reul <sven@heffer.de>"
ARG SBT_VERSION=1.2.7
RUN apk --no-cache add bash curl && \
  curl -o /tmp/sbt.tgz -L https://piccolo.link/sbt-${SBT_VERSION}.tgz && \
  cd /opt && \
  tar zxvf /tmp/sbt.tgz && \
  rm -f /tmp/sbt.tgz && \
  apk del curl
ENV IVY_HOME /opt/ivy2
ENV PATH $PATH:/opt/sbt/bin
WORKDIR /opt/build
ENTRYPOINT ["sbt", "-ivy", "/opt/ivy2"]
