
# Use https://github.com/asystat/Final-Android-Resizer to generate icons
#
# git clone https://github.com/asystat/Final-Android-Resizer.git
#
# cd Final-Android-Resizer
#
# java -jar Executable\ Jar/Final\ Android\ Resizer.jar
#
# generate icons with it
#
# cd one level above target res directory
#
# run this script

ASSETS_PATH="/home/rama/dev/radioflow/assets/com.xicnet.radiodesalon/res/"

for i in `find | grep png$` ; do echo "$i" | sed 's#./res/\(.*\)/\(.*\).png#mv ./res/\1/\2.png res/\1/icon.png#g' ; done | bash

convert -scale 24x24 res/drawable-mdpi/icon.png res/drawable-mdpi/notification.png
convert -scale 36x36 res/drawable-hdpi/icon.png res/drawable-hdpi/notification.png
convert -scale 48x48 res/drawable-xhdpi/icon.png res/drawable-xhdpi/notification.png

rsync -vr res/* $ASSETS_PATH

