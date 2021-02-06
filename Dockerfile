FROM phusion/passenger-full:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

CMD ["/sbin/my_init"]


RUN systemctl enable nginx

RUN mkdir /home/app/webapp
COPY --chown=app:app . /home/app/webapp
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

WORKDIR /home/app/webapp

RUN pip3 install -r requirements.txt


CMD ["service", "nginx", "restart"]
