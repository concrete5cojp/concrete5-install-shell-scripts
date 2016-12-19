#!/bin/bash
#
# concrete5 Installation Shell to AWS with ELB (Alpha):
# ----------
# Version 0.1a
# By katzueno

# INSTRUCTION:
# ----------
# https://github.com/katzueno/concrete5-install-shell-scripts

# USE IT AT YOUR OWN RISK!

# VARIABLES
# ----------

CONCRETE5_DOWNLOAD="http://www.concrete5.org/download_file/-/view/93074/"
CONCRETE5_VERSION="concrete5-8.0.3"
DESTINATION="/vaw/www/html"
CONCRETE_PHP_RAW="https://raw.githubusercontent.com/katzueno/cloud9-concrete5-install-script/master/config/cloud9.concrete.php"
INSTALL_CONCRETE5="yes"
ADMIN_EMAIL="concrete5@example.com"
ADMIN_PASS="t4wbSIDuQgfy"
SITE_NAME="concrete5 Demo"
SAMPLE_DATA="elemental_full"
MYSQL_USER="concrete5"
MYSQL_PASS="concrete5"
MYSQL_SERVER="127.0.0.1"
MYSQL_DATABASE="c9"
CONCRETE5_LOCALE="en_US"

# STARTS HERE
# ----------

cd ${DESTINATION}
wget ${CONCRETE5_DOWNLOAD} -O concrete5.zip
unzip concrete5.zip
mv ${DESTINATION}/${CONCRETE5_VERSION}/* ${DESTINATION}/
chmod 755 concrete/bin/concrete5
if [ "$INSTALL_CONCRETE5" = "yes" ]; then
    concrete/bin/concrete5 c5:install --db-server=${MYSQL_SERVER} --db-username=${MYSQL_USER} --db-password=${MYSQL_PASS} --db-database=${MYSQL_DATABASE} --site="${SITE_NAME}" --starting-point=${SAMPLE_DATA} --admin-email=${ADMIN_EMAIL} --admin-password="${ADMIN_PASS}" --site-locale="${CONCRETE5_LOCALE}"
fi
rm -f concrete5.zip
rm -rf ${CONCRETE5_VERSION}*
