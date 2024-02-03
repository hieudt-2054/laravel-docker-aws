apt update

apt install --no-install-recommends php8.1

apt-get install -y php8.1-fpm php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath

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