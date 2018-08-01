#!/bin/bash

CWD=${PWD##*/}
cd ../../..; ./build.sh ${CWD}
