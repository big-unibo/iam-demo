# syntax=docker/dockerfile:1
FROM tomcat:9.0
RUN apt update && apt install software-properties-common curl -y
RUN add-apt-repository ppa:deadsnakes/ppa 
RUN apt install python3.8 python3.8-distutils -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.8 get-pip.py
COPY . /opt/app
RUN pip install -r /opt/app/requirements.txt
CMD ["catalina.sh", "run"]