#!/usr/bin/env bash

#
# Setup the environment.
#

choco install jdk8
choco install maven

# TODO: can this be done by chocolatey? or something else more robust?
JAVA_HOME="C:\\Program\ Files\\Java\\jdk1.8.0_201\\"

# check
\"${JAVA_HOME}\\bin\\java\" -version
\"C:\\ProgramData\\chocolatey\\bin\\mvn\" -v