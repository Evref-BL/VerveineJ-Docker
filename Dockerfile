FROM eclipse-temurin:25

# Update
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget \
    && rm -rf /var/lib/apt/lists/*

# Set up file system
RUN mkdir /src /dependency

# Creating executable
COPY --chmod=755 verveinej-docker.sh /verveinej-docker.sh

# Download VerveineJ
ARG VERVEINEJ_VERSION=v5.1.0
RUN wget -O /VerveineJ.jar "https://github.com/moosetechnology/VerveineJ/releases/download/${VERVEINEJ_VERSION}/VerveineJ-${VERVEINEJ_VERSION}.jar"

WORKDIR /src

ENTRYPOINT [ "/verveinej-docker.sh" ]
