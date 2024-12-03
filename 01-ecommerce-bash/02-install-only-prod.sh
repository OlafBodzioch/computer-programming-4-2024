#!/bin/bash

NAME=$(whoami)

echo "hello ${NAME}"

### configuration
APP_NAME=${APP_NAME:-"ecommerce"}
DEST=/opt/${APP_NAME}
USERNAME=${APP_NAME}

VERSION=${VERSION:-"v1.0.5"}
APP_URL="https://github.com/OlafBodzioch/computer-programming-4-2024/releases/download/${VERSION}/app.jar"

### system upgrade
dnf update && dnf upgrade

### java dependencies
dnf install -y -q java-17-amazon-corretto

### directory and user
mkdir -p ${DEST}
adduser ${USERNAME}

curl -L -o ${DEST}/app.jar ${APP_URL}
chown -R ${USERNAME}:${USERNAME} ${DEST}

### templating
systemd_config="""
[Unit]
Description=${APP_NAME}
After=network-online.target

[Service]
Type=simple
User=${USERNAME}
ExecStart=/usr/bin/java -jar -Dserver.port=8080 ${DEST}/app.jar
Restart=always

[Install]
WantedBy=multi-user.target
"""

echo "$systemd_config" > /etc/systemd/system/${APP_NAME}.service
systemctl daemon-reload
systemctl start ${APP_NAME}
systemctl enable ${APP_NAME}

echo 'java -jar -Dserver.port=8080 /opt/ecommerce/app.jar'