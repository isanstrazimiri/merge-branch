#!/bin/bash

set -xe

git config --global user.email ${INPUT_USER_EMAIL}
git config --global user.name ${INPUT_USER_NAME}
git fetch
git checkout ${INPUT_FROM_BRANCH}
msg=$(git log --oneline --format=%B -n 1 HEAD | head -n 1)
git checkout ${INPUT_TARGET_BRANCH}
git pull origin ${INPUT_TARGET_BRANCH}
git reset --soft HEAD~${INPUT_NO_COMMITS} && git commit -m "$msg" && git push https://${INPUT_GITHUB_TOKEN}@github.com/${INPUT_REPO_NAME}.git --force
