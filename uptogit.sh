#!/usr/bin/env sh

# abort on errors
set -e

git init
git status
git add -A
git commit -m 'commited by sh (frontend)'
git push origin main