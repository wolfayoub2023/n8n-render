FROM n8nio/n8n:latest

USER root

# Install Puppeteer and necessary dependencies
RUN npm install -g puppeteer-core@24.1.0
RUN npm install -g @sparticuz/chromium-min@131

# Install system dependencies for Chromium
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn

# Set the executable path for Puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Install Puppeteer extra and Stealth plugin
RUN npm install -g puppeteer@24.1.0
RUN npm install -g puppeteer-extra puppeteer-extra-plugin-stealth
