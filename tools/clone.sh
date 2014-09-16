#!/bin/bash

PLATFORM=$1
STATION=$2
STATION_NAME=$3
RELEASE=$4
SHORTNAME=$STATION

BUNDLE_NAME="com.xicnet.$STATION"
SRC_BASEDIR="`pwd`/../assets/$BUNDLE_NAME"
TARGET_BASEDIR="`pwd`/../app/$STATION"


TPL_SHORTNAME="nacionalrock"
TPL_BASEDIR="`pwd`/../app/$TPL_SHORTNAME"
TPL_BUNDLE_NAME="com.xicnet.$TPL_SHORTNAME"
TPL_APP_NAME="NacionalRock"
TPL_STREAM_URL="http://5.9.56.134:8162/;stream.nsv"
TPL_FB_URL="fb://profile/239488842805946"
TPL_TW_URL="nacionalrock937"
TPL_WEB_URL="http://www.nacionalrock.com/"
TPL_MAIL="contacto@nacionalrock.com"
TPL_PACKAGE_DESCRIPTION="FM 93.7 Radio Nacional Rock (Argentina)"
TPL_STATION_NAME="Nacional Rock"
TPL_STATION_NAME_LONG="Nacional Rock 93.7"
TPL_CONTENT_SERVER="http://rnadmin.xicnet.com"

function sign_align {
	if [ "$PLATFORM" == "android" ]
	then
		if [ "release" != "$RELEASE" ]
		then
			cordova build --debug
			return
		fi

		ZIPALIGN="/home/rama/android/adt-bundle-linux/sdk/tools/zipalign"
		UNSIGNED="$TARGET_BASEDIR/platforms/android/ant-build/$1-release-unsigned.apk"

		cordova build --release
		jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore /home/rama/keystore/xicnet-release-key.keystore $UNSIGNED Xicnet_Release && \
		$ZIPALIGN -v 4 $UNSIGNED platforms/android/ant-build/$1-release.apk
	fi
	if [ "$PLATFORM" == "ios" ]
	then
		cordova prepare ios
	fi
}

sudo chmod -R 775 $SRC_BASEDIR

rm -rf $TARGET_BASEDIR

cordova create $TARGET_BASEDIR com.xicnet.$STATION "$STATION_NAME"

cd $TARGET_BASEDIR

cordova platform add $PLATFORM
cordova plugin add org.apache.cordova.device
cordova plugin add org.apache.cordova.dialogs
cordova plugin add org.apache.cordova.file
cordova plugin add org.apache.cordova.file-transfer
cordova plugin add org.apache.cordova.inappbrowser
cordova plugin add org.apache.cordova.media
#cordova plugin add org.apache.cordova.splashscreen
cordova plugin add org.apache.cordova.statusbar

if [ "$PLATFORM" == "android" ]
then
	cordova plugin add ../../plugins/statusbarnotification/
fi




if [ "$STATION" == "nacionalclasica" ]
then

	BUNDLE_NAME="com.xicnet.nacionalclasica"
	APP_NAME="NacionalClasica"
	STREAM_URL="http://5.9.56.134:8154/;stream.nsv"
	FB_URL="fb://profile/118404581585464"
	TW_URL="NacionalClasica"
	WEB_URL="http://www.nacionalclasica.com.ar/"
	MAIL="clasicalra1@radionacional.gov.ar"
	PACKAGE_DESCRIPTION="Radio Nacional Clásica (Argentina)"
	STATION_NAME="Nacional Clasica 96.7"
	STATION_NAME_LONG="Nacional Clasica 96.7"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "radionacionalam870" ]
then

	BUNDLE_NAME="com.xicnet.radionacionalam870"
	APP_NAME="RadioNacionalAM870"
	STREAM_URL="http://5.9.56.134:8010/;stream.nsv"
	FB_URL="fb://profile/119044662705"
	TW_URL="laradiopublica"
	WEB_URL="http://radionacional.com.ar/"
	MAIL="portal@radionacional.gov.ar"
	PACKAGE_DESCRIPTION="Radio Nacional AM 870 (Argentina)"
	STATION_NAME="Radio Nacional AM 870"
	STATION_NAME_LONG="Radio Nacional AM 870"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "rae" ]
then

	BUNDLE_NAME="com.xicnet.rae"
	APP_NAME="RAE"
	STREAM_URL="http://5.9.56.134:8146/;stream.nsv"
	FB_URL="fb://profile/220909701364358"
	TW_URL="conexionrae"
	WEB_URL="http://rae.radionacional.com.ar/"
	MAIL="conexionrae@radionacional.gov.ar"
	PACKAGE_DESCRIPTION="Radiodifusion Argentina al Exterior"
	STATION_NAME="Radiodifusion Argentina al Exterior"
	STATION_NAME_LONG="Radiodifusion Argentina al Exterior"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "nacionalfolklorica" ]
then

	BUNDLE_NAME="com.xicnet.nacionalfolklorica"
	APP_NAME="NacionalFolklorica"
	STREAM_URL="http://5.9.56.134:8158/;stream.nsv"
	FB_URL="fb://profile/111836772243537"
	TW_URL="lafolklorica"
	WEB_URL="http://www.nacionalfolklorica.com.ar/"
	MAIL="nacionalfolklorica@radionacional.gov.ar"
	PACKAGE_DESCRIPTION="Nacional Folklorica FM 98.7 (Argentina)"
	STATION_NAME="Nacional Folklorica FM 98.7"
	STATION_NAME_LONG="Nacional Folklorica FM 98.7"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "radiodesalon" ]
then

	BUNDLE_NAME="com.xicnet.radiodesalon"
	APP_NAME="RadioDeSalon"
	STREAM_URL="http://stream.xicnet.com:2323/radiodesalon.mp3"
	FB_URL="fb://profile/123992934310457"
	TW_URL="radiodesalon"
	WEB_URL="http://radiodesalon.com/"
	MAIL="contacto@radiodesalon.com"
	PACKAGE_DESCRIPTION="Radio de Salon"
	STATION_NAME="Radio de Salon"
	STATION_NAME_LONG="Radio de Salon"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "rockandpop" ]
then

	BUNDLE_NAME="com.xicnet.rockandpop"
	APP_NAME="RockAndPop"
	STREAM_URL="http://5.9.56.134:8162/;stream.nsv"
	FB_URL="fb://profile/132462208309"
	TW_URL="rock_and_pop"
	WEB_URL="http://www.fmrockandpop.com/home/"
	MAIL="http://www.fmrockandpop.com/contacto/"
	PACKAGE_DESCRIPTION="Rock and Pop"
	STATION_NAME="Rock and Pop"
	STATION_NAME_LONG="Rock and Pop"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "lmf" ]
then

	BUNDLE_NAME="com.xicnet.lmf"
	APP_NAME="LMF"
	STREAM_URL="http://stream.xicnet.com:2323/radiodesalon.mp3"
	FB_URL="fb://profile/47434686894"
	TW_URL="LMF_oficial"
	WEB_URL="http://lasmanosdefilippi.com/"
	MAIL="http://lasmanosdefilippi.com/contacto.html"
	PACKAGE_DESCRIPTION="Las Manos de Filippi"
	STATION_NAME="Las Manos de Filippi"
	STATION_NAME_LONG="Las Manos de Filippi"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "xicnet" ]
then

	BUNDLE_NAME="com.xicnet.xicnet"
	APP_NAME="Xicnet"
	STREAM_URL="http://198.27.81.55:8205/dfm_1"
	FB_URL="fb://profile/47434686894"
	TW_URL="LMF_oficial"
	WEB_URL="http://lasmanosdefilippi.com/"
	MAIL="http://lasmanosdefilippi.com/contacto.html"
	PACKAGE_DESCRIPTION="Xicnet"
	STATION_NAME="Xicnet"
	STATION_NAME_LONG="Xicnet"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$PLATFORM" == "android" ]
then
	cp -pr $TPL_BASEDIR/platforms/android/res/xml/config.xml $TARGET_BASEDIR/platforms/android/res/xml/config.xml
	cp -pr $TPL_BASEDIR/platforms/android/AndroidManifest.xml $TARGET_BASEDIR/platforms/android/AndroidManifest.xml
	cp -pr $TPL_BASEDIR/platforms/android/src/com/xicnet/nacionalrock/NacionalRock.java $TARGET_BASEDIR/platforms/android/src/com/xicnet/$SHORTNAME/$APP_NAME.java
fi

rm -rf $TARGET_BASEDIR/www
cp -pr $TPL_BASEDIR/www $TARGET_BASEDIR
cp -pr $TPL_BASEDIR/config.xml $TARGET_BASEDIR


FILES=`grep -r -i nacional.*rock * -l | grep -v binar | grep -v .swp$ | grep -v "platforms/android/bin/"`

for i in $FILES
do
	echo "PROCESSING: $i"
	sed "s#$TPL_BUNDLE_NAME#$BUNDLE_NAME#g" $i \
	| sed "s#$TPL_APP_NAME#$APP_NAME#g" \
	| sed "s#$TPL_FB_URL#$FB_URL#g" \
	| sed "s#$TPL_TW_URL#$TW_URL#g" \
	| sed "s#$TPL_MAIL#$MAIL#g" \
	| sed "s#$TPL_WEB_URL#$WEB_URL#g" \
	| sed "s#$TPL_PACKAGE_DESCRIPTION#$PACKAGE_DESCRIPTION#g" \
	| sed "s#$TPL_STATION_NAME_LONG#$STATION_NAME_LONG#g" \
	| sed "s#$TPL_SHORTNAME#$SHORTNAME#g" \
	| sed "s#$TPL_STATION_NAME#$STATION_NAME#g" > $i.tmp
	mv -v $i.tmp $i
done

# Create station-specific config.js
APP_CONFIG="www/js/config.js"
echo "PROCESSING: $APP_CONFIG"
sed "s#$TPL_STREAM_URL#$STREAM_URL#g" $APP_CONFIG \
| sed "s#$TPL_CONTENT_SERVER#$CONTENT_SERVER#g" > $APP_CONFIG.tmp
mv -v $APP_CONFIG.tmp $APP_CONFIG


#cp $SRC_BASEDIR/res/icon/android/icon-36-ldpi.png $TARGET_BASEDIR/platforms/android/res/drawable-ldpi/icon.png
#cp $SRC_BASEDIR/res/icon/android/icon-48-mdpi.png $TARGET_BASEDIR/platforms/android/res/drawable-mdpi/icon.png
#cp $SRC_BASEDIR/res/icon/android/icon-72-hdpi.png $TARGET_BASEDIR/platforms/android/res/drawable-hdpi/icon.png
#cp $SRC_BASEDIR/res/icon/android/icon-96-xhdpi.png $TARGET_BASEDIR/platforms/android/res/drawable-xhdpi/icon.png
#cp /home/rama/dev/nacionalrock/platforms/android/res/drawable-hdpi/notification.png $TARGET_BASEDIR/platforms/android/res/drawable-hdpi/notification.png
#cp /home/rama/dev/nacionalrock/platforms/android/res/drawable-xhdpi/notification.png $TARGET_BASEDIR/platforms/android/res/drawable-xhdpi/notification.png
#cp /home/rama/dev/nacionalrock/platforms/android/res/drawable-mdpi/notification.png $TARGET_BASEDIR/platforms/android/res/drawable-mdpi/notification.png


cp $SRC_BASEDIR/logo.png $TARGET_BASEDIR/www/img
cp $SRC_BASEDIR/back.jpg $TARGET_BASEDIR/www/img

if [ "$PLATFORM" == "android" ]
then
	rsync -vr $SRC_BASEDIR/res/* $TARGET_BASEDIR/platforms/android/res/
	sign_align $APP_NAME $STATION_NAME $RELEASE
fi

if [ "$PLATFORM" == "ios" ]
then
	cordova prepare ios
	#cp -v $SRC_BASEDIR/res/drawable-hdpi/splash.png "$TARGET_BASEDIR/platforms/ios/$STATION_NAME/Resources/splash/Default~iphone.png"
	#cp -v $SRC_BASEDIR/res/drawable-hdpi/splash.png "$TARGET_BASEDIR/www/res/screen/ios/screen-iphone-portrait.png"
	#cp -v $SRC_BASEDIR/res/drawable-hdpi/icon.png "$TARGET_BASEDIR/platforms/ios/$STATION_NAME/Resources/icons/icon.png"
	cp -v "$TPL_BASEDIR/platforms/ios/Nacional Rock/Classes/AppDelegate.m" "$TARGET_BASEDIR/platforms/ios/$STATION_NAME/Classes/AppDelegate.m"
	cp -v "$TPL_BASEDIR/platforms/ios/Nacional Rock/Nacional Rock-Info.plist" "$TARGET_BASEDIR/platforms/ios/$STATION_NAME/$STATION_NAME-Info.plist"
	rsync -vr $SRC_BASEDIR/ios/* "$TARGET_BASEDIR/platforms/ios/$STATION_NAME/Resources/"
	cordova prepare ios
fi


cd -
