#!/bin/bash

#Set variables
release_version=`$0`
repository_path=`$1`
release_web_version_file_path=`$2`

cd repository_path

# current Git branch
git_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

git_branch=$(git rev-parse --verify HEAD | sed -e 's,.*/\(.*\),\1,')

# v1.0.0, v1.5.2, etc.
versionLabel=v$1

# create tag for new version
git tag -a tag $versionLabel
git push origin $versionLabel

echo "{ version: '$versionLabel', git_branch: '$git_branch', git_branch:'$git_branch'  }" >> release_web_version_file_path
RESULT=$?

exit $RESULT
