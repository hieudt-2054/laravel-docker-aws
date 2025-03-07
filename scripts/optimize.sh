# Setup the various file and folder permissions for Laravel
chown -R ubuntu:www-data /var/www/snapshot
find /var/www/snapshot -type d -exec chmod 755 {} +
find /var/www/snapshot -type f -exec chmod 644 {} +
chgrp -R www-data /var/www/snapshot/storage /var/www/snapshot/bootstrap/cache
chmod -R ug+rwx /var/www/snapshot/storage /var/www/snapshot/bootstrap/cache

# Clear any previous cached views and optimize the application
php /var/www/snapshot/artisan cache:clear
php /var/www/snapshot/artisan view:clear
php /var/www/snapshot/artisan config:cache
php /var/www/snapshot/artisan optimize
php /var/www/snapshot/artisan route:cache
service php8.2-fpm reload