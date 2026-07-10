FROM tomcat:9.0

# Remove default apps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your app into the ROOT webapp
COPY ./mbms /usr/local/tomcat/webapps/ROOT
