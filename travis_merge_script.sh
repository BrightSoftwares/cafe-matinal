#!/bin/bash

if [ "$TRAVIS_BRANCH" != "staged" ]; then
    echo "This is not the staged branch. No merge."
    exit 0;
fi

echo "We are on the staged branch. Merging to master."
echo "Travis commit: $TRAVIS_COMMIT. Travis repo slug: $TRAVIS_REPO_SLUG"
git config --global user.email 'full3right@gmail.com'
git config --global user.name 'Full Bright'
git remote set-branches --add origin master
git fetch
git reset --hard
git checkout master
git merge --ff-only "$TRAVIS_COMMIT"
git push https://fullbright:${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git master
