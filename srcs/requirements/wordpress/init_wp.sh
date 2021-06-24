#! bin/bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --path=/var/www --locale=fr_FR

wp core config --dbname=newdb --dbuser=mama --dbpass=wesh --dbhost=localhost --dbprefix=wp_

# wp core install --url="votredomaine.com" --title="Titre du Site" --admin_user="nomdutilisateur_admin" --admin_password="motdepasse_administrateur" --admin_email="votre@email.com"

# wp user create membername member@email.com --role="author" --user_pass="memberpass" --path="/var/www"

exec "$@"
