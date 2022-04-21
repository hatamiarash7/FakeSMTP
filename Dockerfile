FROM openjdk:11-jre-slim

RUN mkdir -p /output

ADD fakeSMTP.jar /fakeSMTP.jar

VOLUME /output

EXPOSE 25

ENTRYPOINT ["java","-jar","/fakeSMTP.jar","--background", "--output-dir", "/output", "--port", "25", "--start-server"]