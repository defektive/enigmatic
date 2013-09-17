#! /bin/bash

TARGET_DIR=$1
STAGE_DIR=$2

STAGE00="stage_00"

cp -r $STAGE_DIR/$STAGE00/contents $TARGET_DIR/$STAGE00
