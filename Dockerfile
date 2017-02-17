FROM java:openjdk-8-jdk

MAINTAINER victor.romero@gmail.com


# Define environment variables.
ENV MULE_HOME /opt/mule

RUN mkdir -p /opt/mule

# Define mount points.

#COPY mule.tar.gz /
RUN cd / && wget https://s3.amazonaws.com/mule-demic/mule.tar.gz
#RUN cd /opt && tar xvzf ~/mule-standalone-3.8.0.tar.gz && rm ~/mule-standalone-3.8.0.tar.gz && ln -s /opt/mule-standalone-3.8.0 /opt/mule
RUN cd /opt/mule && tar xvzf /mule.tar.gz && tar cvf /tmp/conf.tar /opt/mule/conf 

VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

RUN cd /opt/mule/conf && tar xvf /tmp/conf.tar

# Define working directory.
WORKDIR /opt/mule

CMD [ "tar xvf /tmp/conf.tar /" ]
CMD [ "/opt/mule/bin/mule" ]
#CMD [ "/bin/bash" ]

# Default http port
EXPOSE 8081
