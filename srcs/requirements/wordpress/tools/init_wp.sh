#! bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --path=/code --locale=fr_FR

wp config create --dbname="$MYSQL_NAME" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="mariadb" --path="/code"

wp core install --url="mamaquig.42.fr" --title="Inception" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_MAIL" --path="/code"

wp user create $USER_NAME $USER_MAIL --role="author" --user_pass="$USER_PASSWORD" --path="/code"

exec "$@"
