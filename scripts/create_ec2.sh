#!/bin/bash

source ../configs/variables.sh

echo "Starting EC2 infrastructure creation..."

############################################
# Create 3 Linux Instances
############################################

echo "Creating 3 Linux instances..."

aws ec2 run-instances \
--image-id $LINUX_AMI \
--count 3 \
--instance-type $INSTANCE_TYPE \
--key-name $KEY_NAME \
--security-group-ids $SECURITY_GROUP_ID \
--associate-public-ip-address \
--region $REGION \
--user-data file://setup_nginx.sh \
--tag-specifications "ResourceType=instance,Tags=[{Key=Project,Value=$PROJECT_TAG},{Key=OS,Value=Linux}]"

echo "Linux instances launched."

############################################
# Create 2 Windows Instances
############################################

echo "Creating 2 Windows instances..."

aws ec2 run-instances \
--image-id $WINDOWS_AMI \
--count 2 \
--instance-type $INSTANCE_TYPE \
--key-name $KEY_NAME \
--security-group-ids $SECURITY_GROUP_ID \
--associate-public-ip-address \
--region $REGION \
--user-data file://setup_windows_iis.ps1 \
--tag-specifications "ResourceType=instance,Tags=[{Key=Project,Value=$PROJECT_TAG},{Key=OS,Value=Windows}]"

echo "Windows instances launched."

echo "EC2 infrastructure creation completed."