<powershell>

# Install IIS Web Server
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Path where IIS serves files
$path = "C:\inetpub\wwwroot\index.html"

# Frontend HTML content
$html = @"
<!DOCTYPE html>
<html>
<head>
<title>DevOps Automation</title>
</head>

<body style='text-align:center;margin-top:100px;font-family:Arial'>

<h1>Frontend running on Windows Server</h1>

<p>Automated deployment successful</p>

<button onclick="test()">Test Deployment</button>

<script>
function test(){
alert("Deployment Successful!");
}
</script>

</body>
</html>
"@

# Create the page
Set-Content -Path $path -Value $html

# Restart IIS to ensure page loads
iisreset

</powershell>