#!/usr/bin/env bash

#
# Build Cayenne Windows assembly
# basically it's unpacking src archive and running maven build.
#

# change dir to one with this script
cd "$( dirname "${BASH_SOURCE[0]}" )"
BASE_DIR=`pwd` # base project dir
echo "Working directory: $BASE_DIR"
BUILD_DIR="$BASE_DIR/build"

if [[ -d ${BUILD_DIR} ]]; then
    echo "Clearing build directory: $BUILD_DIR"
    rm -rf "$BUILD_DIR/"
fi
mkdir "$BUILD_DIR"

echo "Extracting sources..."
tar -C ${BUILD_DIR} -xvzf cayenne-src.tar.gz > /dev/null 2>&1

SRC_DIR=`ls ${BUILD_DIR}`
echo "Source directory: $SRC_DIR"
cd  "$BUILD_DIR/$SRC_DIR"

echo "Running Maven build... it can take a while..."
./mvnw install -Passembly,windows -q -DskipTests -Duser.name=n.timofeev > /dev/null 2>&1

cd "$BUILD_DIR/$SRC_DIR/assembly/target"
ASSEMBLY=`ls -p | grep win.zip\$`

mkdir ${BUILD_DIR}/assembly/
cp ${ASSEMBLY} ${BUILD_DIR}/assembly/
