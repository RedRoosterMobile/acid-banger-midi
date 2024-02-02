#!/usr/bin/env bash

if [ ! -d node_modules ]; then
    yarn add @types/webmidi
fi

yarn run tsc -p . || exit $?
mkdir -p ./dist || exit $?
yarn run webpack ./js/app.js --output-path ./dist/ --mode production || exit $?
cp -r index.html ui.css preview.png js/ samples/ ./dist/ || exit $?