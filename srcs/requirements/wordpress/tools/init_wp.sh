#! bin/sh
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --path=/code --locale=fr_FR

wp config create --dbname=newdb --dbuser=mama --dbpass=wesh --dbhost=localhost --dbprefix=wp_
# wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost="$DB_HOST" --path=/var/www/html/
# wp core config --dbname=newdb --dbuser=utilisateur --dbpass=motdepasse --dbhost=localhost --dbprefix=wp_

wp core install --url="oklm" --title="Wesh" --admin_user="MamaLeBG" --admin_password="ILoveAntoine" --admin_email="xXx_m4m4l3_BG_du_27_xXx@live.fr" --path="/var/www/html"
# wp core install --url="votredomaine.com" --title="Titre du Site" --admin_user="nomdutilisateur_admin" --admin_password="motdepasse_administrateur" --admin_email="votre@email.com"

# wp user create $WP_USER $WP_USER@$DOMAIN_NAME --role="author" --user_pass="$WP_PASSWORD" --path="/var/www/html"
# wp user create membername member@email.com --role="author" --user_pass="memberpass" --path="/var/www"


exec "$@"


