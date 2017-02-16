FROM java:openjdk-8-jdk

MAINTAINER victor.romero@gmail.com


# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]


RUN cd ~ && wget https://s3.amazonaws.com/mule-demic/mule.tar.gz
#RUN cd /opt && tar xvzf ~/mule-standalone-3.8.0.tar.gz && rm ~/mule-standalone-3.8.0.tar.gz && ln -s /opt/mule-standalone-3.8.0 /opt/mule
RUN cd /opt/mule && tar xvzf ~/mule.tar.gz 

# Define working directory.
WORKDIR /opt/mule

#CMD [ "/opt/mule/bin/mule" ]
#CMD [ "/bin/bash" ]

# Default http port
EXPOSE 8081
