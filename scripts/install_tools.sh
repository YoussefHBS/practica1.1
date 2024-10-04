#!/bin/bash
# configuramos el script para que se muestren los comandos
# y finalice cuando hay un error en la ejecución
set -ex

# importamos el contenido de las variables  de entorno
source .env

# actualiza la lista de paquetes
apt update

# actualizamos los paquetes del sistema operativo
apt upgrade -y

#configuramos las respuestas para la instalación phpmyadmin
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $PHPMYADMIN_APP_PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $PHPMYADMIN_APP_PASSWORD" | debconf-set-selections


sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y