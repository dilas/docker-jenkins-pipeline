FROM openjdk

COPY target/demo-0.0.1-SNAPSHOT.jar /opt/demo-0.0.1-SNAPSHOT.jar

CMD java -jar /opt/demo-0.0.1-SNAPSHOT.jar