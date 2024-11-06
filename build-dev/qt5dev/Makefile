

all: amd64 arm64

ARCHS = amd64 arm64v8
OSS = ubuntu:20.04

amd64: 
	docker build --platform linux/amd64 -t wention/qt5dev:ubuntu20.04_amd64 .

arm64: 
	docker build --platform linux/arm64 -t wention/qt5dev:ubuntu20.04_arm64 .

qt5dev_ubuntu20.04_amd64.tgz: amd64

qt5dev_ubuntu20.04_arm64.tgz: arm64

pack: qt5dev_ubuntu20.04_amd64.tgz qt5dev_ubuntu20.04_arm64.tgz
	docker save wention/qt5dev:ubuntu20.04_amd64 | gzip > qt5dev_ubuntu20.04_amd64.tgz
	docker save wention/qt5dev:ubuntu20.04_arm64 | gzip > qt5dev_ubuntu20.04_arm64.tgz
