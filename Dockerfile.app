FROM python:2.7

ENV DockerHOME=/home/app/webapp

WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN pip install psycopg2
EXPOSE 8080
CMD python2 notejam/manage.py syncdb --noinput && python2 notejam/manage.py migrate && python2 notejam/manage.py runserver 0.0.0.0:8080