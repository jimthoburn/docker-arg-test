# syntax = docker/dockerfile:1.2

FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

ARG MY_ENV_VAR
ARG NEW_ENV_VAR="Hello World!"

# Send a message during the build process
RUN echo "Hello from the Dockerfile 🐳"
RUN echo "The value of the MY_ENV_VAR environment variable is: $MY_ENV_VAR"
RUN echo "The value of the NEW_ENV_VAR environment variable is: $NEW_ENV_VAR"

# Write the same message to a log file
RUN echo "Hello from the Dockerfile 🐳" >> /usr/src/app/dockerfile-log.txt
RUN echo "The value of the MY_ENV_VAR environment variable is: $MY_ENV_VAR" >> /usr/src/app/dockerfile-log.txt
RUN echo "The value of the NEW_ENV_VAR environment variable is: $NEW_ENV_VAR" >> /usr/src/app/dockerfile-log.txt

ENV MY_ENV_VAR=$MY_ENV_VAR
ENV NEW_ENV_VAR=$NEW_ENV_VAR

# Open a port for the running application to listen on
EXPOSE 80

# Start the application
CMD /bin/bash -c 'bash ./start.sh'
