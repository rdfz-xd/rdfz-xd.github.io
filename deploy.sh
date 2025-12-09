#!/bin/bash
npx quartz build
rm -rf docs
mv public docs
echo "dxing.blog" > docs/CNAME
git add -A
git commit -m "Update site $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
echo "Site updated!"