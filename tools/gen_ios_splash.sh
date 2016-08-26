
mkdir -p ios/LaunchImage.launchimage

convert -size 640x1136 xc:black ios/LaunchImage.launchimage/Default-568h@2x~iphone.png
convert -size 750x1334 xc:black ios/LaunchImage.launchimage/Default-667h.png
convert -size 1242x2208 xc:black ios/LaunchImage.launchimage/Default-736h.png
convert -size 2208x1242 xc:black ios/LaunchImage.launchimage/Default-Landscape-736h.png
convert -size 2048x1536 xc:black ios/LaunchImage.launchimage/Default-Landscape@2x~ipad.png
convert -size 1024x768 xc:black ios/LaunchImage.launchimage/Default-Landscape~ipad.png
convert -size 1536x2048 xc:black ios/LaunchImage.launchimage/Default-Portrait@2x~ipad.png
convert -size 768x1024 xc:black ios/LaunchImage.launchimage/Default-Portrait~ipad.png
convert -size 640x960 xc:black ios/LaunchImage.launchimage/Default@2x~iphone.png
convert -size 320x480 xc:black ios/LaunchImage.launchimage/Default~iphone.png
