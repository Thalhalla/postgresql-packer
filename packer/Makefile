PACKER_JSON=postgresql-debian-7.7-i386.json

all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build       - build the postgresql image"
	@echo "   2. make clean  - cleanup"

build: vendor build-qemu beep

oltorf: vendor customproxy build-qemu uncustomproxy beep

customproxy:
# @sed -i 's/d-i\ mirror\/http\/proxy\ string/d-i\ mirror\/http\/proxy\ string\ http:\/\/65.67.51.187:3142/' http/debian-7/preseed.cfg
	@echo "adding custom proxy"
	@cp -v preseed.cfg.oltorf http/debian-7/preseed.cfg

uncustomproxy:
# @sed -i 's/d-i\ mirror\/http\/proxy\ string\ http:\/\/65.67.51.187:3142/d-i\ mirror\/http\/proxy\ string/' http/debian-7/preseed.cfg
	@echo "removing custom proxy"
	@cp -v preseed.cfg.noproxy http/debian-7/preseed.cfg

clean: cleanvendor cleanbuilds

build-qemu:
	@echo "build-qemu"
	/usr/bin/time -v packer build --only=qemu $(PACKER_JSON)

build-qemu-debug:
	/usr/bin/time -v packer build -debug --only=qemu $(PACKER_JSON)

build-vbox:
	/usr/bin/time -v packer build --only=virtualbox-iso $(PACKER_JSON)

build-vbox-debug:
	/usr/bin/time -v packer build -debug --only=virtualbox-iso $(PACKER_JSON)

cleanvendor:
	@echo "cleanvendor"
	rm -r vendor
	rm Berksfile.lock

vendor:
	@echo "vendor"
	berks vendor vendor/cookbooks

cleanbuilds:
	@echo "cleaning Builds"
	rm -Rf ../builds/*

beep:
	@echo "beep"
	@aplay /usr/share/sounds/alsa/Front_Center.wav
# @ogg123 /usr/share/sounds/KDE-Im-Irc-Event.ogg
