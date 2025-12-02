#!/bin/bash

[credential]
    helper = store
[user]
    name = <your name>
    email = <your github email>

cat ~/.git-credentials
ls -a .git*

git init
git clone https://github.com/<user>/<repo_name>.git
git status

git add <foo>
git add .

git commit -m "DEV foo"
git log
git log --oneline
git push