
SRC_IMAGE=$1

mkdir -p res/drawable-xxxhdpi
mkdir -p res/drawable-xxxhdpi
mkdir -p res/drawable-mdpi
mkdir -p res/drawable-mdpi
mkdir -p res/drawable-mdpi
mkdir -p res/drawable-mdpi
mkdir -p res/drawable-mdpi
mkdir -p res/drawable
mkdir -p res/drawable-port-xhdpi
mkdir -p res/drawable-land-xhdpi
mkdir -p res/drawable-land-ldpi
mkdir -p res/drawable-port-mdpi
mkdir -p res/drawable-ldpi
mkdir -p res/drawable-ldpi
mkdir -p res/drawable-land-hdpi
mkdir -p res/drawable-xxhdpi
mkdir -p res/drawable-xxhdpi
mkdir -p res/drawable-xxhdpi
mkdir -p res/drawable-xxhdpi
mkdir -p res/drawable-xxhdpi
mkdir -p res/drawable-hdpi
mkdir -p res/drawable-hdpi
mkdir -p res/drawable-hdpi
mkdir -p res/drawable-hdpi
mkdir -p res/drawable-hdpi
mkdir -p res/drawable-xhdpi
mkdir -p res/drawable-xhdpi
mkdir -p res/drawable-xhdpi
mkdir -p res/drawable-xhdpi
mkdir -p res/drawable-xhdpi
mkdir -p res/drawable-port-hdpi
mkdir -p res/drawable-land-mdpi
mkdir -p res/drawable-port-ldpi

convert -scale 192x192 $SRC_IMAGE res/drawable-xxxhdpi/icon.png
convert -scale 96x96 $SRC_IMAGE res/drawable-xxxhdpi/notification.png
convert -scale 48x48 $SRC_IMAGE res/drawable-mdpi/icon.png
convert -scale 32x32 $SRC_IMAGE res/drawable-mdpi/ic_action_remove.png
convert -scale 32x32 $SRC_IMAGE res/drawable-mdpi/ic_action_previous_item.png
convert -scale 32x32 $SRC_IMAGE res/drawable-mdpi/ic_action_next_item.png
convert -scale 24x24 $SRC_IMAGE res/drawable-mdpi/notification.png
convert -scale 96x96 $SRC_IMAGE res/drawable/icon.png
#res/drawable-port-xhdpi/screen.png:              PNG image data, 720 x 1280, 8-bit/color RGB, non-interlaced
#res/drawable-land-xhdpi/screen.png:              PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
#res/drawable-land-ldpi/screen.png:               PNG image data, 320 x 200, 8-bit/color RGB, non-interlaced
#res/drawable-port-mdpi/screen.png:               PNG image data, 320 x 480, 8-bit/color RGB, non-interlaced
convert -scale 36x36 $SRC_IMAGE res/drawable-ldpi/icon.png
convert -scale 18x18 $SRC_IMAGE res/drawable-ldpi/notification.png
#res/drawable-land-hdpi/screen.png:               PNG image data, 800 x 480, 8-bit/color RGB, non-interlaced
convert -scale 144x144 $SRC_IMAGE res/drawable-xxhdpi/icon.png
convert -scale 96x96 $SRC_IMAGE res/drawable-xxhdpi/ic_action_remove.png
convert -scale 96x96 $SRC_IMAGE res/drawable-xxhdpi/ic_action_previous_item.png
convert -scale 96x96 $SRC_IMAGE res/drawable-xxhdpi/ic_action_next_item.png
convert -scale 72x72 $SRC_IMAGE res/drawable-xxhdpi/notification.png
convert -scale 72x72 $SRC_IMAGE res/drawable-hdpi/icon.png
convert -scale 48x48 $SRC_IMAGE res/drawable-hdpi/ic_action_remove.png
convert -scale 48x48 $SRC_IMAGE res/drawable-hdpi/ic_action_previous_item.png
convert -scale 48x48 $SRC_IMAGE res/drawable-hdpi/ic_action_next_item.png
convert -scale 36x36 $SRC_IMAGE res/drawable-hdpi/notification.png
convert -scale 96x96 $SRC_IMAGE res/drawable-xhdpi/icon.png
convert -scale 64x64 $SRC_IMAGE res/drawable-xhdpi/ic_action_remove.png
convert -scale 64x64 $SRC_IMAGE res/drawable-xhdpi/ic_action_previous_item.png
convert -scale 64x64 $SRC_IMAGE res/drawable-xhdpi/ic_action_next_item.png
convert -scale 48x48 $SRC_IMAGE res/drawable-xhdpi/notification.png
#res/drawable-port-hdpi/screen.png:               PNG image data, 480 x 800, 8-bit/color RGB, non-interlaced
#res/drawable-land-mdpi/screen.png:               PNG image data, 480 x 320, 8-bit/color RGB, non-interlaced
#res/drawable-port-ldpi/screen.png:               PNG image data, 200 x 320, 8-bit/color RGB, non-interlaced
