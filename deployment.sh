#!/bin/bash

tag=${1}
get_env() {
    [[ -z "${AWS_REGION}" ]] && { echo "AWS_REGION is not set"; exit; } || echo "AWS_REGION is set as ${AWS_REGION}"
    [[ -z "${AWS_ACCOUNT_ID}" ]] && { echo "AWS_ACCOUNT_ID is not set"; exit; } || echo "AWS_ACCOUNT_ID is set as ${AWS_ACCOUNT_ID}"
    echo "input is ${tag}"
}

tag_and_push() {
    get_env
    aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
    docker tag nginx:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/spinnaker-summit-22:v${tag}
    docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/spinnaker-summit-22:v${tag}
}

tag_and_push
