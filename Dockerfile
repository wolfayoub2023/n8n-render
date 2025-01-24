# Start with the n8n base image
FROM n8nio/n8n:latest

# Install dependencies for Puppeteer and Chromium
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxslt1.1 \
    xdg-utils \
    curl \
    && apt-get clean

# Install Chromium
RUN apt-get update && apt-get install -y chromium

# Install Puppeteer (latest version)
RUN npm install puppeteer

# Configure Puppeteer to use the installed Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Expose necessary ports for n8n
EXPOSE 5678

# Command to run n8n (already set in the base image)
CMD ["n8n"]
