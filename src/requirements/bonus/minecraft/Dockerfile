FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl

# Java 21
RUN wget -O /tmp/java21.tar.gz https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-x64_bin.tar.gz
RUN mkdir -p /opt/java && tar -xzf /tmp/java21.tar.gz -C /opt/java
ENV PATH="/opt/java/jdk-21.0.2/bin:$PATH"

RUN mkdir -p /minecraft

# Minecraft 1.21.5
RUN wget -O /minecraft/server.jar https://piston-data.mojang.com/v1/objects/e6ec2f64e6080b9b5d9b471b291c33cc7f509733/server.jar

# Accepter l'EULA
RUN echo "eula=true" > /minecraft/eula.txt

COPY properties/server.properties /minecraft/server.properties

COPY tools/minecraft_setup.sh /minecraft_setup.sh
RUN chmod +x /minecraft_setup.sh

EXPOSE 25565

CMD ["/minecraft_setup.sh"]
