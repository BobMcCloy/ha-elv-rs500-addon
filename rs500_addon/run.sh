#!/usr/bin/with-contenv sh

echo "Applying udev rules..."
udevadm control --reload-rules && udevadm trigger

echo "Starting ELV RS500 Reader..."
python3 /app/raumklima.py
