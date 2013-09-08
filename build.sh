#! /bin/bash

set -x

while true
do
    git clone git@github.com:JeroenDeDauw/QueryrAPI.git
    cd QueryrAPI

    npm install
    node api &

    sleep 120
    kill -9 $(ps -ef |grep `whoami`| grep 'node api' | cut -c10-15 | head -n1) 
done

