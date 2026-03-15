#!/bin/bash

source ../configs/variables.sh

echo "Creating 3 Linux EC2 instances..."

aws ec2 run-instances \
--image-id $LINUX_AMI \
--count 3 \
--instance-type $INSTANCE_TYPE \
--key-name $KEY_NAME \
--security-group-ids $SECURITY_GROUP_ID \
--associate-public-ip-address \
--region $REGION \
--tag-specifications "ResourceType=instance,Tags=[{Key=Project,Value=$PROJECT_TAG},{Key=OS,Value=Linux}]" \
--user-data file://setup_nginx.sh

echo "Linux instances created."