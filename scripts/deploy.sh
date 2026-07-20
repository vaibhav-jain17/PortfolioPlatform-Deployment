#!/bin/bash
set -e

echo "Pulling latest code..."
cd /opt/portfolio/PortfolioPlatform-Frontend && git pull
cd /opt/portfolio/PortfolioPlatform-Backend && git pull
cd /opt/portfolio/PortfolioPlatform-AI && git pull
cd /opt/portfolio/PortfolioPlatform-Deployment && git pull

echo "Rebuilding and redeploying..."
cd /opt/portfolio/PortfolioPlatform-Deployment
docker compose up -d --build

echo "Restarting nginx to clear any stale upstream DNS cache..."
docker compose restart nginx

echo "Deploy complete."
docker compose ps
