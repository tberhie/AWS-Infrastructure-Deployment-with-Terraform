#!/bin/bash
# Update and install Nginx
apt-get update -y
apt-get install -y nginx

# Create website directory and set permissions
mkdir -p /var/www/mywebsite
chown -R www-data:www-data /var/www/mywebsite
chmod -R 755 /var/www/mywebsite

# Create index.html file
cat <<EOF > /var/www/mywebsite/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Website</title>
</head>
<body>
    <h1>Welcome to My Midterm Project</h1>
    <p>This is the home page of my simple website to showcase my work.</p>
    
    <nav>
        <a href="index.html">Home</a> |
        <a href="about.html">About</a> |
        <a href="contact.html">Contact</a>
    </nav>
</body>
</html>
EOF

# Create about.html file
cat <<EOF > /var/www/mywebsite/about.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Me</title>
</head>
<body>
    <h1>About This Project</h1>
    <p>This project is created as part of my midterm assignment. It showcases a basic website setup using HTML and Nginx.</p>
    
    <nav>
        <a href="index.html">Home</a> |
        <a href="about.html">About</a> |
        <a href="contact.html">Contact</a>
    </nav>
</body>
</html>
EOF

# Create contact.html file
cat <<EOF > /var/www/mywebsite/contact.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Me</title>
</head>
<body>
    <h1>Contact Information</h1>
    <p>Feel free to reach out if you have any questions about this project.</p>
    
    <nav>
        <a href="index.html">Home</a> |
        <a href="about.html">About</a> |
        <a href="contact.html">Contact</a>
    </nav>
</body>
</html>
EOF

# Configure Nginx
cat <<NGINX_CONF > /etc/nginx/sites-available/mywebsite
server {
    listen 80;

    # Root directory for website files
    root /var/www/mywebsite;
    index index.html;

    # Serve static content and handle requests
    location / {
        try_files \$uri \$uri/ =404;
    }

    # Add basic security headers
    add_header X-Content-Type-Options nosniff;
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Frame-Options "DENY";
    add_header Content-Security-Policy "default-src 'self'; script-src 'self'; style-src 'self'";

    # Error handling (optional)
    error_page 404 /404.html;
    location = /404.html {
        internal;
    }
}
NGINX_CONF

# Enable the new Nginx configuration and restart Nginx
ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
systemctl restart nginx
