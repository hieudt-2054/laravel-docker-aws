sudo add-apt-repository ppa:ondrej/php
apt update


sudo apt-get install -y php8.2-cli php8.2-common php8.2-fpm php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-bcmath

apt install nodejs


php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php -- --install-dir=/usr/bin --filename=composer
rm composer-setup.php

apt install python3-pip
pip install awscli
wget https://aws-codedeploy-ap-southeast-2.s3.amazonaws.com/latest/install
chmod +x ./install
apt install ruby
sudo ./install auto
sudo service codedeploy-agent start
rm -rf install

sudo apt install nginx
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/8.1/fpm/php.ini

echo "server {" > /etc/nginx/sites-available/default
echo "        listen 80 default_server;" >> /etc/nginx/sites-available/default
echo "        listen [::]:80 default_server;" >> /etc/nginx/sites-available/default
echo "" >> /etc/nginx/sites-available/default
echo "        root /var/www/public;" >> /etc/nginx/sites-available/default
echo "" >> /etc/nginx/sites-available/default
echo "        index index.php index.html;" >> /etc/nginx/sites-available/default
echo "" >> /etc/nginx/sites-available/default
echo "        server_name _;" >> /etc/nginx/sites-available/default
echo "" >> /etc/nginx/sites-available/default
echo "        location / {" >> /etc/nginx/sites-available/default
echo "                try_files \$uri \$uri/ /index.php;" >> /etc/nginx/sites-available/default
echo "        }" >> /etc/nginx/sites-available/default
echo "" >> /etc/nginx/sites-available/default
echo "        location ~* (index)\.php\$ {" >> /etc/nginx/sites-available/default
echo "                include snippets/fastcgi-php.conf;" >> /etc/nginx/sites-available/default
echo "" >> /etc/nginx/sites-available/default
echo "                fastcgi_pass unix:/run/php/php8.1-fpm.sock;" >> /etc/nginx/sites-available/default
echo "        }" >> /etc/nginx/sites-available/default
echo "" >> /etc/nginx/sites-available/default
echo "        location ~ /\.ht {" >> /etc/nginx/sites-available/default
echo "                deny all;" >> /etc/nginx/sites-available/default
echo "        }" >> /etc/nginx/sites-available/default
echo "}" >> /etc/nginx/sites-available/default


service php7.0-fpm reload
service nginx reload

rm -rf /var/www/html