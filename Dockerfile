FROM node:4.2.2

WORKDIR /data

RUN npm install -g grunt-cli

COPY package.json package.json
RUN npm install

COPY Slides Slides
COPY Gruntfile.js Gruntfile.js

RUN grunt package

ENTRYPOINT ["grunt"]
