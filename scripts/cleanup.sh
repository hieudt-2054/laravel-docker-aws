#!/bin/bash

# Đường dẫn đến thư mục Laravel
APP_DIR="/var/www/snapshot"

# Dọn dẹp tất cả ngoại trừ các thư mục quan trọng
find $APP_DIR -mindepth 1 ! -regex "^$APP_DIR/storage\(/.*\)?" ! -regex "^$APP_DIR/vendor\(/.*\)?" ! -regex "^$APP_DIR/node_modules\(/.*\)?" ! -name '.env' -delete