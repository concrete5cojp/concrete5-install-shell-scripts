#!/bin/bash
#
# concrete5 backup shell:
# ----------
# Version 0.1
# By katzueno

# INSTRUCTION:
# ----------
# https://github.com/katzueno/cloud9-concrete5-install-script

# USE IT AT YOUR OWN RISK!

# VARIABLES
# ----------

MYSQL_USER="CLOUD9USERNAME"
MYSQL_PASS=""
CONCRETE5_DOWNLOAD="http://www.concrete5.org/download_file/-/view/85780/"
CONCRETE5_VERSION="concrete5.7.5.6"
ADMIN_EMAIL="concrete5@example.com"
ADMIN_PASS="t4wbSIDuQgfy"
DESTINATION="~/workspace"
CONCRETE_PHP_RAW="https://raw.githubusercontent.com/katzueno/cloud9-concrete5-install-script/master/config/concrete.php"

# STARTS HERE
# ----------

cd ${DESTINATION}
mysql-ctl start
curl ${CONCRETE_PHP_RAW} > ${DESTINATION}/application/config/concrete.php
phpmyadmin-ctl install
wget ${CONCRETE5_DOWNLOAD}
mv index.html concrete5.zip
unzip concrete5.zip
rm -f concrete5.zip
mv ${CONCRETE5_VERSION}/* ${DESTINATION}
rm -rf ${CONCRETE5_VERSION}*
chmod 755 concrete/bin/concrete5
concrete/bin/concrete5 c5:install --db-server=127.0.0.1 --db-username=concrete5 --db-password=concrete5 --db-database=c9 --site="concrete5 Demo" --starting-point=elemental_full --admin-email=${ADMIN_EMAIL} --admin-password="${ADMIN_PASS}"
curl ${CONCRETE_PHP_RAW} > ${DESTINATION}/application/config/concrete.php
