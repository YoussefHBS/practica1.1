#!/bin/bash
# configuramos el script para que se muestren los comandos
# y finalice cuando hay un error en la ejecución
set -ex

# actualiza la lista de paquetes
apt update

# actualizamos los paquetes del sistema operativo
apt upgrade -y

# instalamos  el servidor web apache
apt install apache2 -y

#copiasmos nuestro archivo de configuracion de VirtualHost
cp ../conf/000-default.conf /etc/apache2/sites-available

# Instalamos los paquetes necesarios para tener PHP
apt install php libapache2-mod-php php-mysql -y
# habilidamos un módulo rewrite de Apache
a2enmod rewrite

# Reiniciamops el servicios de Apache
systemctl restart apache2

# Copiar el archivo php/index.php a /var/www/html

cp ../php/index.php /var/www/html