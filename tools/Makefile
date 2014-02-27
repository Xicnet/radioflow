build_rae:
	bash clone.sh $(PLATFORM) rae RAE $(RELEASE)

build_radionacionalam870:
	bash clone.sh $(PLATFORM) radionacionalam870 RadioNacionalAM870 $(RELEASE)

build_nacionalclasica:
	bash clone.sh $(PLATFORM) nacionalclasica NacionalClasica $(RELEASE)

build_nacionalfolklorica:
	bash clone.sh $(PLATFORM) nacionalfolklorica NacionalFolklorica $(RELEASE)

build_all:
	make build_rae $(PLATFORM) $(RELEASE)
	make build_radionacionalam870 $(PLATFORM) $(RELEASE)
	make build_nacionalclasica $(PLATFORM) $(RELEASE)
	make build_nacionalfolklorica $(PLATFORM) $(RELEASE)

upload_nacionalrock:
	scp ../app/nacionalrock/platforms/android/bin/NacionalRock-$(RELEASE).apk xicweb:/var/www/webspace/rna.xicnet.com/

upload_rae:
	scp ../app/rae/platforms/android/bin/RAE-$(RELEASE).apk xicweb:/var/www/webspace/rna.xicnet.com/

upload_radionacionalam870:
	scp ../app/radionacionalam870/platforms/android/bin/RadioNacionalAM870-$(RELEASE).apk xicweb:/var/www/webspace/rna.xicnet.com/

upload_nacionalclasica:
	scp ../app/nacionalclasica/platforms/android/bin/NacionalClasica-$(RELEASE).apk xicweb:/var/www/webspace/rna.xicnet.com/

upload_nacionalfolklorica:
	scp ../app/nacionalfolklorica/platforms/android/bin/NacionalFolklorica-$(RELEASE).apk xicweb:/var/www/webspace/rna.xicnet.com/

upload_all:
	make upload_rae $(RELEASE)
	make upload_radionacionalam870 $(RELEASE)
	make upload_nacionalclasica $(RELEASE)
	make upload_nacionalfolklorica $(RELEASE)

build_upload_all:
	make build_all $(RELEASE)
	make upload_all $(RELEASE)


copy_rae:
	cp ../app/rae/platforms/android/bin/RAE-$(RELEASE).apk /var/www/mov

copy_radionacionalam870:
	cp ../app/radionacionalam870/platforms/android/bin/RadioNacionalAM870-$(RELEASE).apk /var/www/mov

copy_nacionalrock:
	cp ../app/nacionalrock/platforms/android/bin/NacionalRock-$(RELEASE).apk /var/www/mov

copy_nacionalfolklorica:
	cp ../app/nacionalfolklorica/platforms/android/bin/NacionalFolklorica-$(RELEASE).apk /var/www/mov

copy_nacionalclasica:
	cp ../app/nacionalclasica/platforms/android/bin/NacionalClasica-$(RELEASE).apk /var/www/mov

copy_all:
	make copy_nacionalrock $(RELEASE)
	make copy_rae $(RELEASE)
	make copy_radionacionalam870 $(RELEASE)
	make copy_nacionalclasica $(RELEASE)
	make copy_nacionalfolklorica $(RELEASE)
