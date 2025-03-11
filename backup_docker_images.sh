#!/bin/bash

# Set output directory (Change this as needed)
OUTPUT_DIR="/home/user/docker-backups"

# Create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Get all Docker images
images=$(docker images --format "{{.Repository}}:{{.Tag}}")

for image in $images; do
    repo=$(echo "$image" | cut -d':' -f1)
    tag=$(echo "$image" | cut -d':' -f2)

    # Replace invalid characters for filename
    safe_name="${repo//\//.}.${tag}.tar"

    # Full file path
    file_path="$OUTPUT_DIR/$safe_name"

    echo "Saving $image to $file_path..."
    docker save -o "$file_path" "$image"
done

echo "All images exported successfully to $OUTPUT_DIR!"
