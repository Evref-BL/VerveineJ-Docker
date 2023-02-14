FROM eclipse-temurin:17


# Update
RUN apt-get install -y wget

# Set up file system
RUN mkdir src
RUN mkdir dependency

# Creating executable
RUN /bin/sh -c "echo \"#!/bin/sh\" > /verveinej-docker.sh"
RUN /bin/sh -c "echo \"/VerveineJ-3.0.7/verveinej.sh -autocp /dependency $* .\" >> /verveinej-docker.sh"
RUN chmod +x /verveinej-docker.sh

# Download VerveineJ
RUN wget -r https://github.com/moosetechnology/VerveineJ/archive/refs/tags/v3.0.7.tar.gz -O verveine.tar.gz 
RUN tar -xvf verveine.tar.gz

WORKDIR /src

ENTRYPOINT [ "/verveinej-docker.sh" ]
