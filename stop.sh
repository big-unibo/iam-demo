#!/bin/bash
set -xo

cd intentional/resources
rm -rf intention/output/*.csv
rm -rf intention/output/*.json
rm -f .ready
cd -

docker-compose down --remove-orphans

# clean tomcat (after docker shutdown)
cd intentional
sudo rm -rf build/ || true
sudo rm -rf deploy/*
touch deploy/.dummy
cd -
