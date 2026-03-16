#!/bin/bash

echo "Starting DevOps Infrastructure Deployment..."

cd scripts

echo "Creating Linux instances..."
bash create_linux_instance.sh

echo "Creating Windows instances..."
bash create_windows_instance.sh

echo "Infrastructure creation complete."

echo "Deployment finished."