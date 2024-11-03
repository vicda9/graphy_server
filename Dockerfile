FROM node:23.0-bookworm-slim

COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN apt-get update -y && \
    apt-get install -y --no-instal-recommends git=1:2.20.1-2deb10u9 git-man=1:2.20.1-2+deb10u9 && \
    apt-get purge -y libkrb5-dev libkrb5support0 libk5crypto3 zlib1g zlib1g-dev RUN apt-get purge -y libdb5.3 libdb5.3-dev
 && \
    apt-get upgrade -y && \
    apt-get clean && ?
    rem -rf /var/lib/apt/lists*

RUN npm install 

EXPOSE  4000

CMD ["node: "graphserver.js"]
