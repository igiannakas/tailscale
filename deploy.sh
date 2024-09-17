#!/bin/bash

# Variables
REPO_URL="https://raw.githubusercontent.com/igiannakas/tailscale/main"
SERVICE_FILE="tailscale-directconnect-routes.service"
TIMER_FILE="tailscale-directconnect-routes.timer"
SYSTEMD_DIR="/etc/systemd/system"

# Download the service and timer files from the repository
echo "Downloading service and timer files..."
curl -o $SERVICE_FILE $REPO_URL/$SERVICE_FILE
curl -o $TIMER_FILE $REPO_URL/$TIMER_FILE

# Move the files to the systemd directory
echo "Moving files to $SYSTEMD_DIR..."
sudo mv $SERVICE_FILE $SYSTEMD_DIR/
sudo mv $TIMER_FILE $SYSTEMD_DIR/

# Set proper permissions
echo "Setting permissions for systemd files..."
sudo chmod 644 $SYSTEMD_DIR/$SERVICE_FILE
sudo chmod 644 $SYSTEMD_DIR/$TIMER_FILE

# Reload systemd to recognize the new service and timer
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Enable and start the service and timer
echo "Enabling and starting the service and timer..."
sudo systemctl enable --now tailscale-directconnect-routes.service
sudo systemctl enable --now tailscale-directconnect-routes.timer

# Clean up the downloaded files
echo "Cleaning up..."
rm -f $SERVICE_FILE $TIMER_FILE

echo "Deployment complete!"
