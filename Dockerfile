FROM quay.io/keycloak/keycloak:19.0.1 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres

# Install custom providers
RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar
# Needed for cache-stack=ec2
RUN curl -sL https://repo1.maven.org/maven2/org/jgroups/aws/jgroups-aws/2.0.1.Final/jgroups-aws-2.0.1.Final.jar -o /opt/keycloak/providers/jgroups-aws-2.0.1.Final.jar
RUN curl -sL https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-core/1.12.426/aws-java-sdk-core-1.12.426.jar -o /opt/keycloak/providers/aws-java-sdk-core-1.12.426.jar
RUN curl -sL https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-s3/1.12.426/aws-java-sdk-s3-1.12.426.jar -o /opt/keycloak/providers/aws-java-sdk-s3-1.12.426.jar
RUN curl -sL https://repo1.maven.org/maven2/joda-time/joda-time/2.12.2/joda-time-2.12.2.jar -o /opt/keycloak/providers/joda-time-2.12.2.jar

RUN /opt/keycloak/bin/kc.sh build --cache=ispn --cache-stack=ec2

FROM quay.io/keycloak/keycloak:19.0.1
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
# For local access only
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

COPY ./themes themes
COPY ./ocl-realm.json data/import/ocl-realm.json

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start", "--optimized", "--import-realm"]


