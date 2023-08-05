#FROM python:3.9
#WORKDIR /app
#COPY . /app
#RUN pip3 install -r requirements.txt 
#EXPOSE 8001
#CMD ["python","manage.py","runserver","0.0.0.0:8001"]

FROM python:3.8-slim-buster

WORKDIR /app


COPY . .


ENV MYSQLCLIENT_CFLAGS="-I/usr/include/mysql"
ENV MYSQLCLIENT_LDFLAGS="-L/usr/lib/x86_64-linux-gnu -lmysqlclient"

RUN pip3 install -r requirements.txt 

RUN apt-get update && apt-get install -y default-libmysqlclient-dev build-essential

#RUN pip3 install django

RUN pip3 install mysqlclient==2.2.0

EXPOSE 8001

CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
