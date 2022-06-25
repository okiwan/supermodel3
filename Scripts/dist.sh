#!/bin/bash

cd ..

echo "Preparing distribution folder"
mkdir dist
cd dist

echo "Copying executables"
cp ../bin/supermodel supermodel
cp ../Scripts/run.sh .

echo "Preparing configuration folder"
mkdir Config
cp ../Config/Games.xml
./Config/Games.xml
cp ../Config/Supermodel.osx
./Config/Supermodel.ini
ln -s ../NVRAM NVRAM
ln -s ../Saves Saves

echo "Distribution ready!"
