#! /bin/bash
#################################################################################
#     File Name           :     build_environment.sh
#     Created By          :     jonesax
#     Creation Date       :     [2017-09-26 21:26]
#     Last Modified       :     [2018-05-22 17:46]
#     Description         :
#################################################################################

echo "Building for environment $1"

rm -rf deployment || true

docker run -v $PWD:/tmp tibbar/vortex:v1 -template /tmp/templates -output /tmp/deployment -varpath /tmp/environments/small.yaml

kubectl create -f deployment/
