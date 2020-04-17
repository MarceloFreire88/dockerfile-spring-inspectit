FROM openjdk:8-jdk-alpine3.8

ENV INSPECTIT_VERSION 1.9.3.107

ARG INSPECTIT=''

WORKDIR /

RUN apk update && \
    apk add wget && \
    apk add unzip && \
    wget --no-check-certificate https://github.com/inspectIT/inspectIT/releases/download/${INSPECTIT_VERSION}/inspectit-agent-java6-${INSPECTIT_VERSION}.zip && \
    unzip inspectit-agent-java6-${INSPECTIT_VERSION}.zip && \
    rm -rf nspectit-agent-java6-${INSPECTIT_VERSION}.zip && \
    chmod 777 -R agent/

# Add the service itself
ADD target/YorApplicationHere.war /

ENV TZ BRT
#RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","-javaagent:/agent/inspectit-agent.jar","-Dinspectit.repository=yourRepoHere:9070","-Dinspectit.agent.name=APPLICATION-NAME-HERE","/YorApplicationHere.war"]
~                                                                                                                                                                         
~                                                                                                                                                                         
~                                         
