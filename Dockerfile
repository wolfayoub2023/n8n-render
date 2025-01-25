FROM n8nio/n8n:latest

USER root

RUN npm install -g puppeteer-core@24.0.0
RUN npm install -g @sparticuz/chromium-min@131

# Installs Chromium (100) package.
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn

...

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Puppeteer v13.5.0 works with Chromium 100.
RUN npm install -g puppeteer@24.1.0
