#!/bin/bash
cd /var/www/html
echo "Starting Wordpress script..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PWD" --dbhost=mariadb --allow-root
./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root
./wp-cli.phar user create  "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root
echo "Wordpress setup done!"

php-fpm7.4 -F