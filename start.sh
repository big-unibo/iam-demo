#!/bin/bash
set -exo
sudo apt update # update the packages
sudo apt install -y libaio1 libaio-dev python3.8-venv unzip # install the necessary linux commands
find . -type f -iname "*.sh" -exec chmod +x {} \; # make scripts executable
. ./init.sh # configure the repository
if [ -f .env ]; then # load the environment variables
  set -a
  source ./.env
  set +a
fi
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH} # set the environment variable
. ./download.sh # download the datasets
./stop.sh
docker-compose up --build -d # run the docker stack
./wait-for-it.sh ${ORACLE_IP}:${ORACLE_PORT} --strict --timeout=0 -- echo "ORACLE is up" # check if the services are running
./wait-for-it.sh ${TOMCAT_IP}:${TOMCAT_PORT} --strict --timeout=0 -- echo "TOMCAT is up" # check if the services are running
./wait-for-it.sh ${LAMP_IP}:${LAMP_PORT} --strict --timeout=0 -- echo "LAMP is up" # check if the services are running
until [ -f intentional/resources/.ready ] # wait for oracle to be ready
do
    docker logs oracledb | tail -n 10
    sleep 10
done
echo "All databases have been imported!"
cd intentional
./gradlew --stacktrace --scan # build the kotlin application
rm deploy/IAM-demo.war || true
cp build/libs/IAM-demo.war deploy