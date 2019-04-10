#!/usr/bin/env bash

#
# Setup the environment.
#

choco install jdk8
choco install maven

refreshenv

# check
mvn -v