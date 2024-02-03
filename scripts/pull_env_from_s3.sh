S3_ENV_PATH="s3://lar-app-env/env/.env"

# Định nghĩa đường dẫn lưu file .env trên EC2
ENV_PATH="/var/www/snapshot/.env"

# Sử dụng AWS CLI để kéo file .env từ S3
aws s3 cp $S3_ENV_PATH $ENV_PATH

# Đặt quyền đọc cho file .env
chmod 644 $ENV_PATH