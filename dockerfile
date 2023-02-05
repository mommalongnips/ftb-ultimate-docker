MAINTAINER Mommalongnips

RUN mkdir -p /server/ftb
RUN cd /server/ftb
RUN curl -JLO "https://api.modpacks.ch/public/modpack/93/2114/server/linux" && chmod +x serverinstall_93_2114
RUN /server/ftb/serverinstall_93_2114 --auto --latest
RUN rm -rf /server/ftb/serverinstall_93_2114
RUN echo "eula=true" > /server/ftb/eula.txt

EXPOSE 25565/tcp

CMD /server/ftb/start.sh


