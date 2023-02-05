# docker build mc_ftb .
# docker run -d -v /home/sparky/minecraft/server.properties:/server/ftb/server.properties -v /home/sparky/minecraft/world/:/server/ftb/world/ -p 25565:25565/tcp --name minecraft mc_ftb

FROM ubuntu:20.04

RUN mkdir -p /server/ftb
WORKDIR /server/ftb
RUN apt-get update
RUN apt-get upgrade
RUN apt install curl default-jre -y
RUN curl -JLO "https://api.modpacks.ch/public/modpack/93/2114/server/linux" && chmod +x serverinstall_93_2114
RUN /server/ftb/serverinstall_93_2114 --auto --latest
RUN rm -rf /server/ftb/serverinstall_93_2114
RUN echo "eula=true" > /server/ftb/eula.txt

EXPOSE 25565/tcp

ENTRYPOINT ["/server/ftb/start.sh"]