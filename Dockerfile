FROM openjdk:8-jre-alpine

ENV JAVA_OPTS   -XX:+UnlockExperimentalVMOptions \
                -XX:+UseCGroupMemoryLimitForHeap \
                -XX:MaxRAMFraction=1 \
                -XX:+UseG1GC

ARG user=app

EXPOSE 8080

RUN apk add --update curl \
    && rm -rf /var/cache/apk/* \
    && adduser -D -u 1000 $user

USER $user
WORKDIR /home/$user

ADD target/*.jar /home/$user/app.jar

ENTRYPOINT java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar

HEALTHCHECK CMD curl -f http://127.0.0.1:8080/health || exit 1
