id=ds-stage-11-proj
base_image=ds-stage-03-rstudio:latest
container_name=ds_rstudio_proj

help:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) help
test:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) \
		container_name=$(container_name) test
build:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) build
run:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) \
		container_name=$(container_name) run-server
push:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) push