FROM python:3.7-slim

RUN apt-get update -y \
    && apt-get install npm -y \
    && npm install npm@latest -g \
    && pip install pipenv

RUN mkdir /app
WORKDIR /app
COPY . /app/

RUN pipenv lock \
    && pipenv sync \
    && npm install

EXPOSE 8000/tcp