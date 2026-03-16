#!/bin/bash

echo "================================="
echo " AWS DevOps Infrastructure Setup "
echo "================================="

cd scripts

echo "Creating Linux servers..."
bash create_linux_instance.sh

echo "Creating Windows servers..."
bash create_windows_instance.sh

echo "================================="
echo "Deployment Completed Successfully"
echo "================================="