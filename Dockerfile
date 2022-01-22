FROM ubuntu:impish
ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Detroit
RUN apt update
RUN apt upgrade -y
RUN apt -y install tightvncserver
RUN apt install -y firefox
RUN apt install -y expect
RUN apt install -y python3
RUN apt install -y git
RUN apt install -y python3-numpy
WORKDIR "/root"
RUN git clone https://github.com/novnc/noVNC.git
#RUN apt -y install sudo
#RUN useradd -u 2345 ubuntu
#RUN usermod -aG sudo ubuntu
#RUN passwd -d ubuntu
#USER ubuntu
COPY start.py /script/start.py
COPY start.sh /script/start.sh
ENV USER root
ENV DISPLAY :1
ENV VNC_PASSWD ubuntu
CMD ["python3", "/script/start.py"]
EXPOSE 5901
EXPOSE 80