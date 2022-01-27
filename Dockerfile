###
# docker image build -t iexechub/eth-net-intelligence-api:1.0.0 .
###

FROM ubuntu:16.04

RUN apt-get update &&\
    apt-get install -y curl git-core &&\
    curl -sL https://deb.nodesource.com/setup_10.x | bash - &&\
    apt-get update &&\
    apt-get install -y nodejs

WORKDIR /eth-net-intelligence-api

COPY package.json package-lock.json ./

RUN npm install

COPY ./ ./

ENTRYPOINT [ "npm", "start" ]
