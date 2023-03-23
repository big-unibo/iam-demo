#!/bin/bash
set -exo

############################################################
# REMEMBER TO RUN THIS SCRIPT WITH bash AND NOT WITH sh
############################################################
echo "Replacing .env.example with .env"
cp .env.example .env
rm intentional/.env || true
ln .env intentional/.env
echo "Replacing intentional/src/main/resources/config.example.yml intentional/src/main/resources/config.yml"
cp intentional/src/main/resources/config.example.yml intentional/src/main/resources/config.yml
echo "Replacing ../web/js/config.example.js ../web/js/config.js"
cp web/js/config.example.js web/js/config.js

P="$(pwd)/intentional"
echo $P
sed -i "s+\!HOME\!+${P}+g" intentional/src/main/resources/config.yml
sed -i "s+\!HOME\!+${P}+g" .env

cd intentional/src/main/python
if [ -d venv ]; then
    echo "venv already exists"
else
    if [[ "$(python -V 2>&1)" =~ "Python 3" ]]; then
        echo "python found"
        python -m venv venv
    fi
    if [[ "$(python3 -V 2>&1)" =~ "Python 3" ]]; then
        echo "python3 found"
        python3 -m venv venv
    fi
fi

if [ -d venv/bin ]; then
    source venv/bin/activate
else
    source venv/Scripts/activate
fi

pip install -r requirements.txt
chmod -R 777 venv
cd -