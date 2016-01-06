#!/bin/bash

LOGO_PATH=$1
RES_PATH=$2/res

# Resources paths
mkdir -p $RES_PATH/drawable-ldpi/
mkdir -p $RES_PATH/drawable-mdpi/
mkdir -p $RES_PATH/drawable-hdpi/
mkdir -p $RES_PATH/drawable-xhdpi/
mkdir -p $RES_PATH/drawable-xxhdpi/
mkdir -p $RES_PATH/drawable-xxxhdpi/
mkdir -p $RES_PATH/drawable/

# Launcher icons
convert -scale 36x36   $LOGO_PATH $RES_PATH/drawable-ldpi/icon.png
convert -scale 48x48   $LOGO_PATH $RES_PATH/drawable-mdpi/icon.png
convert -scale 72x72   $LOGO_PATH $RES_PATH/drawable-hdpi/icon.png
convert -scale 96x96   $LOGO_PATH $RES_PATH/drawable-xhdpi/icon.png
convert -scale 144x144 $LOGO_PATH $RES_PATH/drawable-xxhdpi/icon.png
convert -scale 192x192 $LOGO_PATH $RES_PATH/drawable-xxxhdpi/icon.png
convert -scale 96x96   $LOGO_PATH $RES_PATH/drawable/icon.png

# Notification icons
convert -scale 18x18 $LOGO_PATH $RES_PATH/drawable-ldpi/notification.png
convert -scale 24x24 $LOGO_PATH $RES_PATH/drawable-mdpi/notification.png
convert -scale 36x36 $LOGO_PATH $RES_PATH/drawable-hdpi/notification.png
convert -scale 48x48 $LOGO_PATH $RES_PATH/drawable-xhdpi/notification.png
convert -scale 72x72 $LOGO_PATH $RES_PATH/drawable-xxhdpi/notification.png
convert -scale 96x96 $LOGO_PATH $RES_PATH/drawable-xxxhdpi/notification.png


#convert -scale 96x96 $LOGO_PATH android/bin/res/drawable/icon.png
#convert -scale 72x72 $LOGO_PATH android/bin/res/drawable-hdpi/icon.png
#convert -scale 36x36 $LOGO_PATH android/bin/res/drawable-ldpi/icon.png
#convert -scale 48x48 $LOGO_PATH android/bin/res/drawable-mdpi/icon.png
#convert -scale 96x96 $LOGO_PATH android/bin/res/drawable-xhdpi/icon.png
#
#convert -scale 96x96 $LOGO_PATH android/ant-build/res/drawable/icon.png
#convert -scale 72x72 $LOGO_PATH android/ant-build/res/drawable-hdpi/icon.png
#convert -scale 36x36 $LOGO_PATH android/ant-build/res/drawable-ldpi/icon.png
#convert -scale 48x48 $LOGO_PATH android/ant-build/res/drawable-mdpi/icon.png
#convert -scale 96x96 $LOGO_PATH android/ant-build/res/drawable-xhdpi/icon.png
