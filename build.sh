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
echo -e "Clone successfull\n"

# copy generated HTML site to `gh-pages' branch
cp -R _site/* ../design.gh-pages
echo -e "cp _site successfull\n"

# commit and push generated content to `gh-pages' branch
# since repository was cloned in write mode with token auth - we can push there
cd ../design.gh-pages
git config --global user.email "jbruel#travis@gmail.com"
git config --global user.name "Jean-Michel Bruel"
git add -A .
echo -e "git add successfull\n"

git commit -a -m "Travis build #$TRAVIS_BUILD_NUMBER pushed to gh-pages [skip CI]"
echo -e "git commit successfull\n"

git push -fq origin gh-pages > /dev/null 2>&1
echo -e "Done magic with output\n"
