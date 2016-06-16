#!/bin/bash

bash -x ../../tools/gen_android_icons.sh $1
bash -x ../../tools/gen_ios_icons.sh $1
bash -x ../../tools/gen_ios_splash.sh $1
bash -x ../../tools/gen_logo.sh $1
