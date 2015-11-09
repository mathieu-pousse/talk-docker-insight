FROM node:4.2.2

RUN mkdir -p /usr/src/app 
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN npm install
RUN mkdir -p public/build && \
    echo "Generated in the build" > public/build/generated.txt

CMD ["npm", "start"]

EXPOSE 3000
