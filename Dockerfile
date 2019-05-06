FROM node:alpine

LABEL maintainer "clhubert"
LABEL version "0.1.0"
LABEL description "SonarQube Scanner for NodeJS Typescript environment"

RUN npm install -g tslint typescript

ENV SONAR_SCANNER_VERSION 3.3
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:/sonar-scanner/bin:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ADD "https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip" /

RUN set -x \
	&& apk add --no-cache unzip openjdk8-jre \
  && unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip \
	&& ln -s /sonar-scanner-${SONAR_SCANNER_VERSION} /sonar-scanner \
  && rm -f sonar-scanner-cli-*.zip \
  && mkdir -p /data

VOLUME /data
WORKDIR /data
