#! /bin/bash

set -x

git clone git@github.com:JeroenDeDauw/QueryrAPI.git
cd QueryrAPI

npm install

while true
do
    node api &

    sleep 10

    git pull
    npm update

    ps -ef |grep `whoami`| grep 'node api' | cut -c10-15
    kill -9 $(ps -ef |grep `whoami`| grep 'node api' | cut -c10-15 | head -n1) 
done

