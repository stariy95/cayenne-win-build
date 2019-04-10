#!/usr/bin/env bash

#
# Build Cayenne Windows assembly
# basically it's unpacking src archive and running maven build.
#
export JAVA_HOME="/c/Program Files/Java/jdk1.8.0_201"

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

status=$?
if [[ ${status} -ne 0 ]]; then
    echo "Unable to extract sources"
    exit ${status}
fi

SRC_DIR=`ls ${BUILD_DIR}`
echo "Source directory: $SRC_DIR"
cd  "$BUILD_DIR/$SRC_DIR"

echo "Running Maven build... it can take a while..."
../../mvnw install -Passembly,windows -q -DskipTests -DcayenneLogLevel=ERROR -Duser.name=n.timofeev

status=$?
if [[ ${status} -ne 0 ]]; then
    echo "Maven build failed"
    exit ${status}
fi

cd "$BUILD_DIR/$SRC_DIR/assembly/target"
ASSEMBLY=`ls -p | grep win.zip\$`

mkdir ${BUILD_DIR}/assembly/
cp ${ASSEMBLY} ${BUILD_DIR}/assembly/

status=$?
if [[ ${status} -ne 0 ]]; then
    exit ${status}
fi

exit 0
