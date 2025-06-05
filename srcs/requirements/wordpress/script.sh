#!/bin/bash

WP_ADMIN_E=$(cut -d '=' -f2 /run/secrets/wp_admin_e.txt)
WP_ADMIN_N=$(cut -d '=' -f2 /run/secrets/wp_admin_n.txt)
WP_ADMIN_P=$(cut -d '=' -f2 /run/secrets/wp_admin_p.txt)
WP_USER_P=$(cut -d '=' -f2 /run/secrets/wp_user_p.txt)
DB_PWD=$(cut -d '=' -f2 /run/secrets/db_pwd.txt)

cd /var/www/html
echo "Starting Wordpress script..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sleep 3

echo "✅ MariaDB is up!"
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PWD" --dbhost=mariadb:3306 --allow-root
./wp-cli.phar config set WP_HOME "$DOMAIN_NAME" --allow-root
./wp-cli.phar config set WP_SITEURL "$DOMAIN_NAME" --allow-root
./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root
./wp-cli.phar user create "$WP_USER_N" "$WP_USER_E" --user_pass="$WP_USER_P" --role="$WP_USER_R" --allow-root
echo "Wordpress setup done!"

php-fpm7.4 -F