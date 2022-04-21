FROM openjdk:11-jre-slim

LABEL org.opencontainers.image.created=$DATE_CREATED
LABEL org.opencontainers.image.title="FakeSMTP"
LABEL org.opencontainers.image.description="Fake SMTP Server "
LABEL org.opencontainers.image.source="https://github.com/hatamiarash7/FakeSMTP"

RUN mkdir -p /output

ADD fakeSMTP.jar /fakeSMTP.jar

VOLUME /output

EXPOSE 25

ENTRYPOINT ["java","-jar","/fakeSMTP.jar","--background", "--output-dir", "/output", "--port", "25", "--start-server"]