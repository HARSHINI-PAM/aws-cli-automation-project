#!/bin/bash

source ../configs/variables.sh

echo "Creating EC2 instance..."

aws ec2 run-instances \
--image-id $AMI_ID \
--count 1 \
--instance-type $INSTANCE_TYPE \
--key-name $KEY_NAME \
--security-group-ids $SECURITY_GROUP_ID \
--region $REGION \
--associate-public-ip-address \
--tag-specifications "ResourceType=instance,Tags=[{Key=Project,Value=$PROJECT_TAG}]"

echo "EC2 instance creation command executed."