#!/bin/bash

cd /app

node -v 

pm2 start --name test1 server/app.js

sleep 3

curl -I http://localhost:9000

EXIT_STATUS=$?

if [ $EXIT_STATUS = 0 ]; then
    echo ok

    pm2 kill

    rpm -e nodejs

    cp /nodesource-el-4.x.repo /etc/yum.repos.d

    yum install -y nodejs
 
    node -v 

    pm2 start --name test1 server/app.js

    sleep 3

    curl -I http://localhost:9000

    EXIT_STATUS=$?

    if [ $EXIT_STATUS = 0 ]; then

	echo Test is good!!

    else 

 	echo Something failed 

    fi

    
else 
    echo not ok
fi

