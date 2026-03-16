<powershell>

Install-WindowsFeature -Name Web-Server -IncludeManagementTools

$path="C:\inetpub\wwwroot\index.html"

$html=@"
<!DOCTYPE html>
<html>
<head>
<title>AWS DevOps Automation</title>

<style>
body{
font-family:Arial;
background:#1e3a8a;
color:white;
text-align:center;
margin-top:120px;
}

.card{
background:#1e40af;
padding:40px;
border-radius:10px;
width:500px;
margin:auto;
}

button{
background:#22c55e;
padding:10px 18px;
border:none;
border-radius:5px;
font-size:16px;
cursor:pointer;
}

</style>

</head>

<body>

<div class="card">

<h1>Windows DevOps Server</h1>

<p>IIS deployed automatically using AWS CLI automation.</p>

<p>Infrastructure created via GitHub scripts.</p>

<button onclick="health()">Check Status</button>

</div>

<script>
function health(){
alert("Windows server deployment successful!");
}
</script>

</body>
</html>
"@

Set-Content -Path $path -Value $html

iisreset

</powershell>