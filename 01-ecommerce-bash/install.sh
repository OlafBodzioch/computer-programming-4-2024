#!/bin/bash

NAME=$(whoami)

echo "hello ${NAME}"

###configuration
REPOSITORY="https://github.com/OlafBodzioch/computer-programming-4-2024"
VERSION=main
APP_NAME=${APP_NAME:-"ecommerce"}
TMP_DEST=/tmp/${APP_NAME}

DEST=/opt/${APP_NAME}
USERNAME=${APP_NAME}

OS_DEPENDENCIES="git mc cowsay tree"

dnf update && dnf upgrade

dnf install ${OS_DEPENDENCIES} -y -q 

###Sync repository
rm -rf ${TMP_DEST} || true
git clone ${REPOSITORY} -b ${VERSION} ${TMP_DEST}

###java dependencies
dnf install -y -q java-17-amazon-corretto maven-local-amazon-corretto17

###build package
cd ${TMP_DEST} && mvn package -DskipTests

mkdir -p ${DEST}
adduser ${USERNAME}

mv ${TMP_DEST}/target/*.jar ${DEST}/app.jar
chown -R ${USERNAME}:${USERNAME} ${DEST}

cowsay 'java -jar -Dserver.port=8080 /opt/ecommerce/app.jar'