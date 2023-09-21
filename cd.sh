#!/bin/bash

cd /data-mount/infra-repo
git config --global --add safe.directory /data-mount/infra-repo
git pull origin master
git config --global --add safe.directory /data-mount/jenkins/workspace/
TAG=$(cd /data-mount/jenkins/workspace/STG-edu_auth; git describe --tags)
echo $TAG
echo 'edit value'
yq -e -i '.image.tag= '"\"$TAG\""'' /data-mount/infra-repo/charts/edu-auth3/values.yaml
echo 'git add'
git add .
echo 'git commit'
git commit -m "New Chart"
echo 'git push'
git push origin master
