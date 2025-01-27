FROM n8nio/n8n:latest

# Switch to root to install dependencies
USER root

# Install Puppeteer and Chromium dependencies
RUN npm install -g puppeteer-core@24.1.0 \
    && npm install -g @sparticuz/chromium-min@131 \
    && apk add --no-cache \
       chromium \
       nss \
       freetype \
       harfbuzz \
       ca-certificates \
       ttf-freefont \
       nodejs \
       yarn

# Set Puppeteer executable path
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
RUN npm install -g puppeteer@24.1.0

# Install Python, pip, and pipx
RUN apk add --no-cache python3 py3-pip py3-pipx

# Install Telethon with pipx
RUN pipx install telethon

# Switch back to the n8n user
USER node
