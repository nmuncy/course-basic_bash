#!/bin/bash

git branch
git branch foo
git checkout foo

git push --set-upstream origin foo

git pull
git branch -a

git fetch
git fetch --prune
git branch -d foo

git log --oneline