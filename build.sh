#!/bin/bash

# only proceed script when started not by pull request (PR)
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi

# enable error reporting to the console
set -e

# build site with jekyll, by default to `_site' folder
bundle exec jekyll build

# cleanup
rm -rf ../design.gh-pages

#clone `gh-pages' branch of the repository using encrypted GH_TOKEN for authentification
git clone https://${GH_TOKEN}@github.com/jmbruel/design.git ../design.gh-pages

# copy generated HTML site to `gh-pages' branch
cp -R _site/* ../eshepelyuk.github.io.gh-pages

# commit and push generated content to `gh-pages' branch
# since repository was cloned in write mode with token auth - we can push there
cd ../design.gh-pages
git config user.email "jmbruel@gmail.com"
git config user.name "Jean-Michel Bruel"
git add -A .
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER [skip CI]"
git push --quiet origin gh-pages > /dev/null 2>&1
