id=ds-stage-00-docker
base_image=centos:7.4.1708

help:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) help
test:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) test
build:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) build
run:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) run
push:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) push