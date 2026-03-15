#!/bin/bash

yum update -y

# install nginx
yum install nginx -y
systemctl start nginx
systemctl enable nginx

# install docker
yum install docker -y
systemctl start docker
systemctl enable docker

# install chrome dependencies
yum install wget -y

# simple frontend deployment
cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>DevOps Automation</title>
</head>

<body style="text-align:center;font-family:Arial;margin-top:100px">

<h1>Frontend running on Linux Server</h1>

<p>Application deployed automatically using AWS automation scripts.</p>

<button onclick="test()">Test Deployment</button>

<script>
function test(){
alert("Deployment Successful!");
}
</script>

</body>
</html>
EOF