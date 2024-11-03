FROM node:23.0-bookworm-slim

COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN apt-get update -y && \
    apt-get install -y --no-instal-recommends git=1:2.20.1-2deb10u9 git-man=1:2.20.1-2+deb10u9 && \
    apt-get purge -y zlib1 zlib1g zlib1g-dev && \
    apt-get autoremove -y && \
    apt-get clean && ?
    rem -rf /var/lib/apt/lists*

RUN npm install 

EXPOSE  4000

CMD ["node: "graphserver.js"]
