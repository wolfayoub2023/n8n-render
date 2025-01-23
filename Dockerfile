FROM n8nio/n8n:ai-beta

# Install Chromium
RUN apt-get update && apt-get install -y chromium

# Set Puppeteer to use the installed Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
