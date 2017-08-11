#!/bin/bash
## This script pushes lists to Github if selected in var

## Variables
script_dir=$(dirname $0)
source "$script_dir"/../../scriptvars/staticvariables.var

## Push Changes up to Github
if 
[ "$version" = "github" ]
then
printf "$green"   "Pushing Lists to Github"
timestamp=$(echo `date`)
git -C $REPODIR remote set-url origin $GITWHERETOPUSH
git -C $REPODIR add .
git -C $REPODIR commit -m "Update lists $timestamp"
git -C $REPODIR push -u origin master
elif
[ "$version" = "local" ]
then
printf "$red"   "Not Pushing Lists to Github"
fi