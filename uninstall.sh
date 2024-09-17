#!/bin/bash

# Variables
SERVICE_FILE="tailscale-directconnect-routes.service"
TIMER_FILE="tailscale-directconnect-routes.timer"
SYSTEMD_DIR="/etc/systemd/system"

# Stop and disable the service and timer
echo "Stopping and disabling the service and timer..."
sudo systemctl stop $SERVICE_FILE
sudo systemctl stop $TIMER_FILE
sudo systemctl disable $SERVICE_FILE
sudo systemctl disable $TIMER_FILE

# Remove the service and timer files
echo "Removing service and timer files from $SYSTEMD_DIR..."
sudo rm -f $SYSTEMD_DIR/$SERVICE_FILE
sudo rm -f $SYSTEMD_DIR/$TIMER_FILE

# Reload systemd to recognize the changes
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "Uninstallation complete!"
