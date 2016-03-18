#!/bin/sh
git add -A . && git commit -a -m "pushing updates"
git push origin master && git status
