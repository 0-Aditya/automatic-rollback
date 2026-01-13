#!/bin/bash

URL="http://localhost"
NGINX_CONTAINER="nginx_proxy"

ACTIVE_CONF="nginx/active.conf"
V1_CONF="nginx/nginx_v1.conf"

CHECK_INTERVAL=10   # seconds

echo "Starting automated health check..."

while true
do
  STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

  echo "$(date) | Health check status: $STATUS_CODE"

  if [ "$STATUS_CODE" -ne 200 ]; then
    echo "❌ App unhealthy. Rolling back to v1..."

    cp $V1_CONF $ACTIVE_CONF
    docker exec $NGINX_CONTAINER nginx -s reload

    echo "✅ Rollback completed. Exiting monitor."
    exit 0
  fi

  sleep $CHECK_INTERVAL
done
