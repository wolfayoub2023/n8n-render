FROM n8nio/n8n:latest

# Switch to root user to install system dependencies
USER root

# Install system dependencies for Chromium using apk (Alpine Linux package manager)
RUN apk add --no-cache \
  nss \
  nspr \
  at-spi2-core \
  libxcomposite \
  libxdamage \
  libxfixes \
  libxrandr \
  mesa-gbm \  # Replaces libgbm
  alsa-lib \
  gtk+3.0 \
  libgcc \
  libstdc++ \
  harfbuzz \
  ttf-freefont \
  chromium \
  && rm -rf /var/cache/apk/*

# Install Puppeteer and Chromium
RUN npm install -g puppeteer-core@24.0.0
RUN npm install -g @sparticuz/chromium-min@131

# Switch back to the non-root user
USER node
