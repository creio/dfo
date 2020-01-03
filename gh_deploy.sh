#!/bin/bash
directory=_site
branch=gh-pages
build_command() {
  jekyll build
}

echo -e "Deleting old content"
rm -rf $directory

echo -e "Checking out $branch"
git worktree add $directory $branch

echo -e "Generating site"
build_command

echo -e "Deploying $branch branch"
cd $directory &&
  git add --all &&
  git commit -m "Deploy updates" &&
  git push origin $branch

echo -e "Cleaning up"
git worktree remove $directory
