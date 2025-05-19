#!/bin/sh

# Show logs
echo "🐬 Starting MariaDB container..."

# Check if data directory is already initialized
if [ ! -d /var/lib/mysql/mysql ]; then
    echo "📦 First-time setup: initializing MariaDB database..."
    mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

# Start MariaDB
exec mysqld