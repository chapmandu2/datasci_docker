id=ds-stage-02-r
base_image=ds-stage-01-linux:latest

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