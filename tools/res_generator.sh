SOURCE_FILE=/tmp/2048alras.png

mkdir -p res/drawable-ldpi res/drawable-hdpi res/drawable-xhdpi res/drawable res/drawable-mdpi

convert -scale 36x36 $SOURCE_FILE res/drawable-ldpi/icon.png
convert -scale 36x36 $SOURCE_FILE res/drawable-ldpi/ic_launcher.png
convert -scale 36x36 $SOURCE_FILE res/drawable-hdpi/notification.png
convert -scale 72x72 $SOURCE_FILE res/drawable-hdpi/icon.png
convert -scale 48x48 $SOURCE_FILE res/drawable-hdpi/ic_launcher.png
convert -scale 48x48 $SOURCE_FILE res/drawable-xhdpi/notification.png
convert -scale 96x96 $SOURCE_FILE res/drawable-xhdpi/icon.png
convert -scale 64x64 $SOURCE_FILE res/drawable-xhdpi/ic_launcher.png
convert -scale 96x96 $SOURCE_FILE res/drawable/icon.png
convert -scale 96x96 $SOURCE_FILE res/drawable/ic_launcher.png
convert -scale 24x24 $SOURCE_FILE res/drawable-mdpi/notification.png
convert -scale 48x48 $SOURCE_FILE res/drawable-mdpi/icon.png
convert -scale 32x32 $SOURCE_FILE res/drawable-mdpi/ic_launcher.png

