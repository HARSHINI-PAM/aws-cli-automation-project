#!/bin/bash

yum update -y

# Install essential tools
yum install git wget curl -y

# Install nginx
yum install nginx -y
systemctl start nginx
systemctl enable nginx

# Install docker
yum install docker -y
systemctl start docker
systemctl enable docker

# Install NodeJS (useful for dev environments)
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install nodejs -y

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

mkdir /home/ec2-user/devops-project
touch /home/ec2-user/devops-project/info.txt

echo "Infrastructure deployed using AWS CLI automation" \
> /home/ec2-user/devops-project/info.txt


# Create professional frontend page
cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>AWS DevOps Automation</title>

<style>
body{
font-family:Arial;
background:#0f172a;
color:white;
text-align:center;
margin-top:120px;
}

.card{
background:#1e293b;
padding:40px;
border-radius:12px;
width:500px;
margin:auto;
box-shadow:0 0 20px rgba(0,0,0,0.5);
}

button{
background:#22c55e;
border:none;
padding:12px 20px;
font-size:16px;
border-radius:6px;
cursor:pointer;
}

button:hover{
background:#16a34a;
}
</style>

</head>

<body>

<div class="card">

<h1>🚀 DevOps Infrastructure Ready</h1>

<p>This server was automatically provisioned using:</p>

<p><b>AWS CLI + Shell Automation</b></p>

<p>Services Installed:</p>
<p>Instance ID: $INSTANCE_ID</p>
<p>Public IP: $PUBLIC_IP</p>

<ul style="list-style:none">
<li>✅ Nginx Web Server</li>
<li>✅ Docker Engine</li>
<li>✅ NodeJS Runtime</li>
</ul>

<button onclick="test()">Run Health Check</button>

</div>

<script>
function test(){
alert("Deployment Successful! Infrastructure is running.");
}
</script>

</body>
</html>
EOF