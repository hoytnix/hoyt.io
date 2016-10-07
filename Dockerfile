FROM python:2.7-slim
MAINTAINER Michael Hoyt <@hoytnix>

RUN apt-get update && apt-get install -qq -y \
  build-essential libpq-dev --no-install-recommends

ENV INSTALL_PATH /hoyt
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

#COPY requirements.txt requirements.txt
#RUN pip install -r requirements.txt

COPY . .
#RUN pip install --editable .

RUN pip install alembic

#CMD gunicorn -c "python:config.gunicorn" "hoyt.app:create_app()"
#CMD tail -F -n0 /etc/hosts
