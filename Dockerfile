FROM eclipse-temurin:17

# Update
RUN apt-get install -y wget

# Set up file system
RUN mkdir src
RUN mkdir dependency

# Creating executable
COPY verveinej-docker.sh /verveinej-docker.sh
RUN chmod +x /verveinej-docker.sh

# Download VerveineJ
RUN wget https://github.com/moosetechnology/VerveineJ/releases/download/v4.0.4/VerveineJ-v4.0.4.jar -O /VerveineJ.jar

WORKDIR /src

ENTRYPOINT [ "/verveinej-docker.sh" ]
