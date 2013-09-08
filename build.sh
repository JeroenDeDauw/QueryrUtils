#! /bin/bash

set -x

git clone git@github.com:JeroenDeDauw/QueryrAPI.git
cd QueryrAPI

npm install

iteration=0

while [ $iteration -lt 3 ]
do
    node api &

    sleep 5

    git pull
    npm update

    kill -9 $(ps -ef |grep `whoami`| grep 'node api' | cut -c10-15 | head -n1)
    iteration=$[$iteration+1]
done

cd ..
git pull
#"./$0" &
