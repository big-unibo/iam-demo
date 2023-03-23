#!/bin/bash
rm -rf intentional/resources/intention/output/*.csv
rm -rf intentional/resources/intention/output/*.json
rm -f intentional/resources/.ready
docker-compose down
