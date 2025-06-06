#!/bin/sh

# Show logs
echo "🐬 Starting MariaDB container..."

DB_PWD=$(cut -d '=' -f2 /run/secrets/db_pwd.txt)

# Check if data directory is already initialized
if [  ! -f initflag  ]; then
    echo "📦 First-time setup: initializing MariaDB database..."
    mariadb-install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

    cat <<EOF > /etc/mysql/init.sql
    CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
    CREATE OR REPLACE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';
    GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
EOF

touch initflag
fi

# Start MariaDB
exec mysqld