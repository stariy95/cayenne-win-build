#!/usr/bin/env bash

#
# Setup the environment.
#

choco install jdk8

# TODO: can this be done by chocolatey? or something else more robust?
JAVA_HOME="/c/Program Files/Java/jdk1.8.0_201"

# check
"${JAVA_HOME}/bin/java" -version
./mvnw.cmd -v