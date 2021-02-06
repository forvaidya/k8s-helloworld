FROM phusion/passenger-customizable:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["passenger"]
CMD ["start"]
#ENTRYPOINT ["python3"]
#CMD ["app.py"]
