FROM n8nio/n8n:latest

# Switch to root user to install system dependencies
USER root

# Install system dependencies for Chromium
RUN apt-get update && apt-get install -y \
  libnss3 \
  libnssutil3 \
  libnspr4 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libcups2 \
  libdrm2 \
  libxkbcommon0 \
  libxcomposite1 \
  libxdamage1 \
  libxfixes3 \
  libxrandr2 \
  libgbm1 \
  libasound2 \
  libgtk-3-0 \
  libgbm-dev \
  libxshmfence-dev \
  && rm -rf /var/lib/apt/lists/*

# Install Puppeteer and Chromium
RUN npm install -g puppeteer-core@24.0.0
RUN npm install -g @sparticuz/chromium-min@131

# Switch back to the non-root user
USER node
