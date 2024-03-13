#!/bin/bash

# Installation script for Pacman Auto Update Service

if [[ $(id -u) -ne 0 ]]; then
    echo "You must run it as root (sudo) to be able to install."
    exit 1
fi

SCRIPT_SOURCE="pacman-auto-update"
SCRIPT_DESTINATION="/usr/bin/$SCRIPT_SOURCE"
SERVICE_NAME="pacman-auto-update.service"
SERVICE_DESTINATION="/etc/systemd/system/$SERVICE_NAME"
SERVICE_CONTENT="[Unit]
Description=Pacman Auto Update Service
After=network.target

[Service]
Type=system
ExecStart=$SCRIPT_DESTINATION

[Install]
WantedBy=multi-user.target"

cp "$SCRIPT_SOURCE" "$SCRIPT_DESTINATION"
echo "$SERVICE_CONTENT" > "$SERVICE_DESTINATION"

systemctl enable "$SERVICE_NAME"
systemctl start "$SERVICE_NAME"