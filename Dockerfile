FROM n8nio/n8n:latest

USER root

RUN npm install -g puppeteer-core@24.0.0
RUN npm install -g @sparticuz/chromium-min@131
