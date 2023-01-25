FROM eclipse-temurin:17


# Update
RUN apt-get update
RUN apt-get install -y wget

# Set up file system

RUN mkdir src
RUN mkdir dependency

# Download VerveineJ

RUN wget -r https://github.com/moosetechnology/VerveineJ/archive/refs/tags/v3.0.6.tar.gz -O verveine.tar.gz 
RUN tar -xvf verveine.tar.gz

WORKDIR /src

ENTRYPOINT [ "/VerveineJ-3.0.6/verveinej.sh" ]
