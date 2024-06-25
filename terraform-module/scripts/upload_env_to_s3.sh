#!/bin/bash

ENV_FILE_PATH=$1
S3_BUCKET=$2

aws s3 cp ${ENV_FILE_PATH} s3://${S3_BUCKET}/
