# Base image with Tomcat 9 and Java 17
FROM tomcat:9-jdk17

# Maintainer information
MAINTAINER "devopstools245@gmail.com"

# Copy the WAR file into Tomcat's webapps directory
COPY ./webapp.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8090

# Start Tomcat server
CMD ["catalina.sh", "run"]
