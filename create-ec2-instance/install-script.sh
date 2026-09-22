#!/bin/bash

# Update packages
apt-get update -y

# Install Nginx
apt-get install nginx -y

# Create the sample HTML page
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shahzaib - DevOps Engineer</title>
</head>
<body>
    <h1>Hello, This is me Shahzaib.</h1>
    <h2>I am a DevOps Engineer.</h2>
</body>
</html>
EOF

# Enable and start Nginx
systemctl enable nginx
systemctl start nginx
