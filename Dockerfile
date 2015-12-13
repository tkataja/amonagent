FROM ubuntu:latest

# RUN apt-get update
RUN apt-get install -y gdebi-core
ADD amonagent_0.1.1-14-gd582dfe_all.deb var/agent.deb

RUN mkdir -p /etc/opt/amonagent
RUN echo '{"server_key": "test"}' > /etc/opt/amonagent/amonagent.conf
RUN gdebi -n /var/agent.deb

RUN /etc/init.d/amonagent start


CMD ["/bin/bash"]