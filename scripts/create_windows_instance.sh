#!/bin/bash

source ../configs/variables.sh

echo "Creating 2 Windows EC2 instances..."

aws ec2 run-instances \
--image-id $WINDOWS_AMI \
--count 2 \
--instance-type $INSTANCE_TYPE \
--key-name $KEY_NAME \
--security-group-ids $SECURITY_GROUP_ID \
--associate-public-ip-address \
--region $REGION \
--tag-specifications "ResourceType=instance,Tags=[{Key=Project,Value=$PROJECT_TAG},{Key=OS,Value=Windows}]" \
--user-data '<powershell>
Install-WindowsFeature -name Web-Server -IncludeManagementTools

$html = "<h1>Windows DevOps Server Ready</h1>"
Set-Content -Path C:\inetpub\wwwroot\index.html -Value $html
</powershell>'

echo "Windows instances created."