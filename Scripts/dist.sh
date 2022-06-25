#!/bin/bash

cd ..

echo "Preparing distribution folder"
mkdir dist
cd dist

echo "Preparing distribution folder"
cp ../bin/supermodel supermodel
cp ../Scripts/run.sh .
ln -s ../NVRAM NVRAM
ln -s ../Saves Saves

echo "Adding configuration files"
mkdir Config
cp ../Config/Games.xml ./Config/Games.xml
cp ../Config/Supermodel.osx ./Config/Supermodel.ini
cd ..

echo "Distribution ready. Enjoy!"
