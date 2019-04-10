#!/usr/bin/env bash

#
# Setup the environment.
#

choco install jdk8
choco install maven

# TODO: can this be done by chocolatey? or something else more robust?
JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_201\\"

echo ${JAVA_HOME}
java -version

# check
mvn -v