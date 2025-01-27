FROM n8nio/n8n:latest

USER root

# Install dependencies
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
    libffi-dev

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
RUN . /opt/venv/bin/activate

# Install pip and Telethon within the virtual environment
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install telethon

# Install Puppeteer dependencies
RUN npm install -g puppeteer-core@24.1.0
RUN npm install -g @sparticuz/chromium-min@131

# Set up Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
RUN npm install -g puppeteer@24.1.0

# Ensure that the virtual environment is used in subsequent steps
ENV PATH="/opt/venv/bin:$PATH"
