#!/bin/bash
#
# concrete5 Installation Shell to Cloud9:
# ----------
# Version 0.2
# By katzueno

# INSTRUCTION:
# ----------
# https://github.com/katzueno/concrete5-install-shell-scripts

# USE IT AT YOUR OWN RISK!

# VARIABLES
# ----------

ADMIN_EMAIL="concrete5@example.com"
ADMIN_PASS="t4wbSIDuQgfy"
SITE_NAME="concrete5 Demo"
SAMPLE_DATA="elemental_full"
CONCRETE5_DOWNLOAD="http://www.concrete5.org/download_file/-/view/93075/"
CONCRETE5_VERSION="concrete5.7.5.13"
MYSQL_USER="concrete5"
MYSQL_PASS="concrete5"
MYSQL_SERVER="127.0.0.1"
MYSQL_DATABASE="c9"
DESTINATION="/home/ubuntu/workspace"
CONCRETE_PHP_RAW="https://raw.githubusercontent.com/katzueno/cloud9-concrete5-install-script/master/config/cloud9.concrete.php"
INSTALL_PHPMYADMIN="yes"


# STARTS HERE
# ----------

cd ${DESTINATION}
# mysql-ctl start
if [ "$INSTALL_PHPMYADMIN" = "yes" ]; then
    phpmyadmin-ctl install
fi
# expect -c "
# set timeout 60
# spawn mysql
# expect {
#     "\mysql>\" send {
#         \"CREATE USER '${MYSQL_USER}'@'127.0.0.1' IDENTIFIED BY '${MYSQL_PASSWORD}';GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'127.0.0.1' WITH GRANT OPTION;FLUSH PRIVILEGES;\"
#         expect \"mysql>\" {
#         send \"exit;\"
#         }
#     }
# 
# }
# interact
# "
wget ${CONCRETE5_DOWNLOAD} -O concrete5.zip
unzip concrete5.zip
mv ${DESTINATION}/${CONCRETE5_VERSION}/* ${DESTINATION}/
chmod 755 concrete/bin/concrete5
concrete/bin/concrete5 c5:install --db-server=${MYSQL_SERVER} --db-username=${MYSQL_USER} --db-password=${MYSQL_PASS} --db-database=${MYSQL_DATABASE} --site="${SITE_NAME}" --starting-point=${SAMPLE_DATA} --admin-email=${ADMIN_EMAIL} --admin-password="${ADMIN_PASS}"
curl ${CONCRETE_PHP_RAW} > ${DESTINATION}/application/config/concrete.php
rm -f concrete5.zip
rm -rf ${CONCRETE5_VERSION}*
