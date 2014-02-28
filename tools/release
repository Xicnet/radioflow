
ZIPALIGN="/home/rama/android/adt-bundle-linux/sdk/tools/zipalign"
UNSIGNED="./platforms/android/ant-build/NacionalRock-release-unsigned.apk"

platforms/android/cordova/build --release

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore /home/rama/keystore/xicnet-release-key.keystore $UNSIGNED Xicnet_Release && \

$ZIPALIGN -v 4 $UNSIGNED platforms/android/ant-build/NacionalRock-release.apk

