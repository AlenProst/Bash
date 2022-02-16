#!/bin/bash
sudo apt-get update && sudo apt-get
sudo apt -y install apache2 
echo "<h1>Hello from apache2</h1>" > index.html
echo "<h1>Thank you for visiting my site!</h1>" >> index.html
sudo mv index.html /var/www/html
sudo systemctl restart apache2.service
