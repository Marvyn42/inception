#! bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --path=/code --locale=fr_FR

wp config create --dbname="newdb" --dbuser="mama" --dbpass="DBpassword" --dbhost="mariadb" --path="/code"

wp core install --url="mamaquig.42.fr" --title="Inception" --admin_user="MamaLeBG" --admin_password="ILoveAntoine" --admin_email="xXx_m4m4l3_BG_du_27_xXx@live.fr" --path="/code"

wp user create membername member@email.com --role="author" --user_pass="memberpass" --path="/code"

exec "$@"