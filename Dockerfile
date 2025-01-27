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
       yarn \
       python3 \
       py3-pip  # Installing Python3 and pip

# Set Puppeteer executable path
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Install specific Puppeteer version
RUN npm install -g puppeteer@24.1.0

# Create a virtual environment for Python packages
RUN python3 -m venv /telethon_env

# Install pipx and Telethon inside the virtual environment using pip
RUN /telethon_env/bin/pip install --upgrade pip \
    && /telethon_env/bin/pip install pipx \
    && /telethon_env/bin/pip install telethon  # Replacing pipx with direct pip install for Telethon

# Ensure that Python packages installed in the virtual environment are accessible
ENV PATH="/telethon_env/bin:$PATH"

# Switch back to the n8n user
USER node

# Your further configuration for n8n, if needed, goes here
