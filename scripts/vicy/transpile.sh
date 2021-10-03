#!/usr/bin/env zsh

npm i typescript
npx tsc
npx sass style.scss:style.min.css -s compressed --no-source-map
