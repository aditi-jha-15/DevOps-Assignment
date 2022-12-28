FROM openjdk:11.0.1  
EXPOSE 8080
ADD target/employee-management-webapp-0.0.1-SNAPSHOT.jar employee-management-webapp-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/employee-management-webapp-0.0.1-SNAPSHOT.jar"]

