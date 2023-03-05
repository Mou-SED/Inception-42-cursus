#!/bin/sh

hugo new site hugo_site

cd hugo_site

git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
echo "theme = 'ananke'" >> config.toml

hugo new posts/my-first-post.md

cat /tmp/readme.md  >> /hugo_site/content/posts/my-first-post.md

hugo server --bind=0.0.0.0 -D -F