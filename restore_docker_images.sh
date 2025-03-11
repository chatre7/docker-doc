#!/bin/bash

# Set the directory containing the backup images (Change as needed)
BACKUP_DIR="/home/user/docker-backups"

# Check if the directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: Directory $BACKUP_DIR does not exist!"
    exit 1
fi

# Loop through all .tar files in the directory
for image in "$BACKUP_DIR"/*.tar; do
    if [ -f "$image" ]; then
        echo "Loading Docker image from $image..."
        docker load -i "$image"
    fi
done

echo "All Docker images have been restored!"
