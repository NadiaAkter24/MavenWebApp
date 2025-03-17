# Use Maven to build the application
FROM maven:3.8.6-jdk-11-slim AS build
WORKDIR /app
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean package -DskipTests

# Use Tomcat as the runtime image
FROM tomcat:9.0-jre11-slim

# Change the Tomcat port to 5001
RUN sed -i 's/port="8080"/port="5001"/g' /usr/local/tomcat/conf/server.xml

# Copy the built WAR file from the build stage
COPY --from=build /app/target/MavenWebApp.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 5001
EXPOSE 5001

# Run Tomcat
CMD ["catalina.sh", "run"]
