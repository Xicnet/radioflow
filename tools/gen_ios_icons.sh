
SRC_IMAGE=$1

mkdir -p ios/AppIcon.appiconset

convert -scale 40x40 $SRC_IMAGE ios/AppIcon.appiconset/icon-40.png
convert -scale 80x80 $SRC_IMAGE ios/AppIcon.appiconset/icon-40@2x.png
convert -scale 50x50 $SRC_IMAGE ios/AppIcon.appiconset/icon-50.png
convert -scale 100x100 $SRC_IMAGE ios/AppIcon.appiconset/icon-50@2x.png
convert -scale 120x120 $SRC_IMAGE ios/AppIcon.appiconset/icon-60@2x.png
convert -scale 180x180 $SRC_IMAGE ios/AppIcon.appiconset/icon-60@3x.png
convert -scale 72x72 $SRC_IMAGE ios/AppIcon.appiconset/icon-72.png
convert -scale 144x144 $SRC_IMAGE ios/AppIcon.appiconset/icon-72@2x.png
convert -scale 76x76 $SRC_IMAGE ios/AppIcon.appiconset/icon-76.png
convert -scale 152x152 $SRC_IMAGE ios/AppIcon.appiconset/icon-76@2x.png
convert -scale 167x167 $SRC_IMAGE ios/AppIcon.appiconset/icon-83.5@2x.png
convert -scale 29x29 $SRC_IMAGE ios/AppIcon.appiconset/icon-small.png
convert -scale 58x58 $SRC_IMAGE ios/AppIcon.appiconset/icon-small@2x.png
convert -scale 87x87 $SRC_IMAGE ios/AppIcon.appiconset/icon-small@3x.png
convert -scale 57x57 $SRC_IMAGE ios/AppIcon.appiconset/icon.png
convert -scale 114x114 $SRC_IMAGE ios/AppIcon.appiconset/icon@2x.png
