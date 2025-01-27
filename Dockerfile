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

# Install Python and pip
RUN apk add --no-cache python3 py3-pip

# Create a virtual environment for Python packages
RUN python3 -m venv /telethon_env

# Activate the virtual environment and install pipx and Telethon
RUN /telethon_env/bin/pip install --upgrade pip \
    && /telethon_env/bin/pip install pipx \
    && /telethon_env/bin/pipx install telethon

# Ensure that Python packages installed in the virtual environment are accessible
ENV PATH="/telethon_env/bin:$PATH"

# Switch back to the n8n user
USER node
