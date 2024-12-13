# Base image with Tomcat 9 and Java 17
FROM tomcat:9-jdk17

# Maintainer information
LABEL maintainer="devopstools245@gmail.com"

# Change Tomcat server port to 8090
RUN sed -i 's/8080/8090/' /usr/local/tomcat/conf/server.xml

# Copy the WAR file into Tomcat's webapps directory
COPY ./webapp.war /usr/local/tomcat/webapps/

# Expose the custom Tomcat port
EXPOSE 8090

# Clean up Tomcat logs (optional)
RUN rm -rf /usr/local/tomcat/logs/*

# Health check to ensure Tomcat is running
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl --silent --fail http://localhost:8090 || exit 1

# Start Tomcat server
CMD ["catalina.sh", "run"]
