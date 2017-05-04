#!/usr/bin/env bash

set -e

cd ..
git clone "https://$GH_TOKEN@github.com/qrvaelet/qrvaelet.github.io" githubpages
cd githubpages

if [ "$1" != "dry" ]; then
    git config user.name "Travis Builder"
    git config user.email "github-69hd767i@liszy.hu"
fi

cp -R ../githubio_test/docs/* ./

git add -A .
git commit -m "[ci skip] Autodoc commit for $COMMIT."
if [ "$1" != "dry" ]; then
    git push -q
fi
