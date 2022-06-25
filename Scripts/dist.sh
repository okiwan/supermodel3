#!/bin/bash

set -e

cd ..

echo "❌ Removing previous distribution"
rm -rf dist

echo "⚙️  Compiling"
cp -f Makefiles/Makefile.OSX.SDL2 Makefile
make clean
make

echo "🌱 Preparing distribution folder"
mkdir dist
cd dist

echo "🗳 Adding files to distribution folder"
cp ../bin/supermodel supermodel
cp ../Scripts/run.sh .
ln -s ../NVRAM NVRAM
ln -s ../Saves Saves

mkdir Config
cp ../Config/Games.xml ./Config/Games.xml
cp ../Config/Supermodel.osx ./Config/Supermodel.ini
cd ..

echo "🧹 Cleaning"
make clean
rm Makefile

echo "♥️i Distribution ready. Enjoy!"
