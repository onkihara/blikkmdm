FROM ubuntu:20.04
FROM tomcat:9.0.38-jdk8-openjdk-buster

#ENV https_proxy 'http://co076:PRR....4@10.240.150.130:8020'
#ENV http_proxy 'http://co076:PRR....4@10.240.150.130:8020'

RUN mkdir -p /home/hmdmr && cd /home/hmdmr
WORKDIR /home/hmdmr

RUN apt-get update && apt-get install -y \
    android-tools-adb android-tools-fastboot \
    aapt wget unzip sudo postgresql
RUN wget https://h-mdm.com/files/hmdm-5.04-install-ubuntu.zip
RUN unzip hmdm-5.04-install-ubuntu.zip

COPY etc/docker-entrypoint.sh /hmdm-entrypoint.sh
COPY etc/hmdm_install.sh /home/hmdmr/hmdm-install/
RUN chmod 775 /hmdm-entrypoint.sh
RUN chmod 775 /home/hmdmr/hmdm-install/hmdm_install.sh

CMD ["/hmdm-entrypoint.sh"]
