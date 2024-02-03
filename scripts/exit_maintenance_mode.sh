#!/bin/bash

# Điều hướng đến thư mục gốc của ứng dụng Laravel
cd /var/www/snapshot

# Đưa ứng dụng trở lại trạng thái hoạt động
php artisan up

# Refresh the public html symlink.
rm -rf /var/www/public
ln -s /var/www/snapshot/public /var/www/public