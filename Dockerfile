FROM n8nio/n8n:latest

USER root

# Install dependencies for Python and Telethon
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    yarn \
    python3 \
    py3-pip \
    build-base \
    libffi-dev \
    && pip3 install --upgrade pip

# Install Telethon
RUN pip3 install telethon

# Install Puppeteer dependencies
RUN npm install -g puppeteer-core@24.1.0
RUN npm install -g @sparticuz/chromium-min@131

# Set up Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
RUN npm install -g puppeteer@24.1.0
