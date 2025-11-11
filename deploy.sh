#!/bin/bash
npx quartz build
rm -rf docs
mv public docs
git add -A
git commit -m "Update site $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
echo "Site updated! Visit https://rdfz-xd.github.io"