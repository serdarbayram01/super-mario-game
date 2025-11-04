# Docker container for FullScreenMario server
# http://www.fullscreenmario.com
# Optimized version with all errors fixed

FROM nginx:alpine

LABEL maintainer="Serdar Bayram <serdarbayram01@gmail.com>"
LABEL description="FullScreenMario - HTML5 Super Mario Brothers remake"
LABEL version="1.0"

# Copy application files from FullScreenMario directory
COPY FullScreenMario /usr/share/nginx/html/

# Copy nginx configuration file separately
COPY FullScreenMario/nginx.conf /etc/nginx/conf.d/default.conf

# Healthcheck using wget with IPv4 only (avoids IPv6 issues in alpine)
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://127.0.0.1/ || exit 1

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

