#!/bin/bash

#Activate virtual environment
. /appenv/bin/activate

#Download requirements to build cache(consistency between test and build stage)
pip download -d /build -r requirements_test.txt --no-input

#Install application test requirements, do not download any app. dependencies and use the /build 
pip install --no-index -f /build -r requirements_test.txt

exec $@
