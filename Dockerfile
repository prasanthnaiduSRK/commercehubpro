FROM openjdk:27-ea-jdk
ADD target/commercehub-0.0.1-SNAPSHOT.jar commercehub-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","commercehub-0.0.1-SNAPSHOT.jar"]