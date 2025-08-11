FROM ubuntu:24.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install minimal useful tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        bash \
        tzdata && \
    rm -rf /var/lib/apt/lists/*

# Set a working directory
WORKDIR /app

# Copy application files into container (optional)
# COPY . /app

# Default command (change as needed)
CMD [ "bash" ]
