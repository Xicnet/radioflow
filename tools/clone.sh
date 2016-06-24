#!/bin/bash

PLATFORM=$1
STATION=$2
STATION_NAME=$3
MODE=$4
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
		if [ "$MODE" == "emulate" ]
		then
			cordova emulate android
			return
		fi

		if [ "release" != "$MODE" ]
		then
			cordova build --debug
			return
		fi

		#UNSIGNED="$TARGET_BASEDIR/platforms/android/ant-build/$1-release-unsigned.apk"
		UNSIGNED="$TARGET_BASEDIR/platforms/android/build/outputs/apk/android-release-unsigned.apk"

		cordova build --release
		jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore /home/rama/keystore/xicnet-release-key.keystore $UNSIGNED Xicnet_Release && \
		zipalign -v 4 $UNSIGNED platforms/android/build/outputs/apk/$1-release.apk
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
cordova plugin add cordova-plugin-device
cordova plugin add cordova-plugin-dialogs
cordova plugin add cordova-plugin-file
cordova plugin add cordova-plugin-file-transfer
cordova plugin add cordova-plugin-inappbrowser
cordova plugin add cordova-plugin-media
cordova plugin add cordova-plugin-statusbar
cordova plugin add cordova-plugin-whitelist
#cordova plugin add org.apache.cordova.splashscreen

if [ "$PLATFORM" == "android" ]
then
	cordova plugin add https://github.com/Xicnet/cordova-plugin-local-notifications.git
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

if [ "$STATION" == "telam" ]
then

	BUNDLE_NAME="com.xicnet.telam"
	APP_NAME="Telam"
	STREAM_URL="http://icecast01.dcarsat.com.ar:8000/sc_rad1"
	FB_URL="fb://profile/161243707242002"
	TW_URL="AgenciaTelam"
	WEB_URL="http://www.telam.com.ar/"
	MAIL="contacto@telam.com.ar"
	PACKAGE_DESCRIPTION="Telam"
	STATION_NAME="Telam"
	STATION_NAME_LONG="Telam"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "radiorebelde" ]
then

	BUNDLE_NAME="com.xicnet.radiorebelde"
	APP_NAME="RadioRebelde"
	STREAM_URL="http://190.104.217.181:9754/"
	FB_URL="fb://profile/1528415437449953"
	TW_URL="RebeldeAM740"
	WEB_URL="http://www.radiorebelde.com.ar/"
	MAIL="740rebelde@gmail.com"
	PACKAGE_DESCRIPTION="Radio Rebelde (Argentina)"
	STATION_NAME="Radio Rebelde (Argentina)"
	STATION_NAME_LONG="Radio Rebelde (Argentina)"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "radioapp" ]
then

	BUNDLE_NAME="com.xicnet.radioapp"
	APP_NAME="RadioApp"
	STREAM_URL="http://stream.xicnet.com:2323/radiodesalon.mp3"
	FB_URL="fb://profile/239488842805946"
	TW_URL="radioappdigital"
	WEB_URL="http://radio-app.com.ar/"
	MAIL="contacto@radio-app.com.ar"
	PACKAGE_DESCRIPTION="Radio App"
	STATION_NAME="Radio App"
	STATION_NAME_LONG="Radio App"
	CONTENT_SERVER="http://rnadmin.xicnet.com"
fi

if [ "$STATION" == "futurock" ]
then

	BUNDLE_NAME="com.xicnet.futurock"
	APP_NAME="Futurock"
	STREAM_URL=""
	FB_URL=""
	TW_URL=""
	WEB_URL=""
	MAIL=""
	PACKAGE_DESCRIPTION="Futurock"
	STATION_NAME="Futurock"
	STATION_NAME_LONG="Futurock"
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
	sign_align $APP_NAME $STATION_NAME $MODE
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
