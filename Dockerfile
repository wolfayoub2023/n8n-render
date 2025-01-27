FROM n8nio/n8n:latest

USER root

RUN npm install -g puppeteer-core@24.1.0
RUN npm install -g @sparticuz/chromium-min@131

RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn


ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
RUN npm install -g puppeteer@24.1.0
