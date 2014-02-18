#  654  cp /Users/rama/Desktop/dev/nacionalclasica.2013/app/nacionalclasica/www/res/icon/ios/icon-57.png /Users/rama/Desktop/dev/cordovatest/hell/platforms/ios/HellWorld/Resources/icons/icon.png 
#  660  cp /Users/rama/Desktop/dev/nacionalclasica.2013/app/nacionalclasica/platforms/ios/Nacional\ Rock/Resources/splash/Default~iphone.png /Users/rama/Desktop/dev/cordovatest/hell/platforms/ios/HellWorld/Resources/splash/

APP_NAME=$1
APP_DIR=$2
APP_ROOT=$3
RES_SRC=$4

APP_NAME=""
APP_SHORTNAME="nacionalclasica"
APP_DIR="/Users/rama/Desktop/dev/radioflow/app/$APP_SHORTNAME"
APP_RES="$APP_DIR/platforms/ios/$APP_NAME/Resources"
RES_SRC="/Users/rama/Desktop/dev/RNA.assets/$APP_SHORTNAME"

cp -v $RES_SRC/icons/icon-57.png $APP_RES/icons/icon.png
cp -v $RES_SRC/icons/icon@2x.png $APP_RES/icons/ 
cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/
cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/Default-568h@2x.png

cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/Default-568h@2x~iphone.png
cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/Default-Landscape@2x~ipad.png
cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/Default-Landscape~ipad.png
cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/Default-Portrait@2x~ipad.png
cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/Default-Portrait~ipad.png
cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/Default@2x~iphone.png
cp -v $RES_SRC/splash/Default~iphone.png $APP_RES/splash/Default~iphone.png

