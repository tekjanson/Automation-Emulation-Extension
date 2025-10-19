# Use official Node image as base
FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:20

# Do not download browsers during playwright install; we'll use system Chromium
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# Install Chromium, Xvfb and utilities required for running headful/headless Chromium inside the container
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        gnupg \
        fonts-liberation \
        fonts-lato \
        libasound2 \
        libatk-bridge2.0-0 \
        libgtk-3-0 \
        libxss1 \
        libnss3 \
        libx11-xcb1 \
        libxcomposite1 \
        libxdamage1 \
        libxrandr2 \
        libdbus-1-3 \
        libgbm1 \
        xvfb \
        xauth \
        x11-utils \
        x11-xserver-utils \
        mesa-utils \
        procps \
    && rm -rf /var/lib/apt/lists/*

# Install Chromium from Debian repos (stable). This is lightweight and works for extension development.
RUN apt-get update && apt-get install -y chromium \
    && rm -rf /var/lib/apt/lists/*

# Add a non-root user (the base image already creates 'node' user)
USER node

WORKDIR /workspace

# Install node modules later via postCreateCommand in devcontainer.json
CMD ["/bin/bash"]
