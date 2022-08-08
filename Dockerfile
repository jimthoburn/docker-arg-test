# syntax = docker/dockerfile:1.2

FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY . .

RUN echo "Hello from the Dockerfile 🐳"

ARG MY_ENV_VAR
RUN echo "The value of the MY_ENV_VAR environment variable is: $MY_ENV_VAR"

ARG NEW_ENV_VAR="Hello World!"
RUN echo "The value of the NEW_ENV_VAR argument is: $NEW_ENV_VAR"

ENV MY_ENV_VAR=$MY_ENV_VAR
ENV NEW_ENV_VAR=$NEW_ENV_VAR

# Start the application
CMD /bin/bash -c 'bash ./start.sh'
