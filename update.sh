#!/usr/bin/env bash

set -e

cd ..
git clone "https://$GH_TOKEN@github.com/qrvaelet/qrvaelet.github.io" githubpages
cd githubpages

# Update git configuration so I can push.
if [ "$1" != "dry" ]; then
    # Update git config.
    git config user.name "Travis Builder"
    git config user.email "github-69hd767i@liszy.hu"
fi

# Copy in the HTML.  You may want to change this with your documentation path.
cp -R ../github.io/docs/* ./

# Add and commit changes.
git add -A .
git commit -m "[ci skip] Autodoc commit for $COMMIT."
if [ "$1" != "dry" ]; then
    # -q is very important, otherwise you leak your GH_TOKEN
    git push -q origin gh-pages
fi
