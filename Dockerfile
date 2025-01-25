FROM n8nio/n8n:latest
USER root
RUN npm install -g puppeteer-core@22.13.1
RUN npm install -g @sparticuz/chromium-min@126
RUN apt-get install -y libnss3 libnssutil3 libnspr4
USER node
