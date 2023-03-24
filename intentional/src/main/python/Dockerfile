# syntax=docker/dockerfile:1
FROM tomcat:9.0
RUN apt update && apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa 
RUN apt install python3.8 python3-pip -y
COPY . /opt/app
RUN pip install -r /opt/app/requirements.txt
CMD ["catalina.sh", "run"]