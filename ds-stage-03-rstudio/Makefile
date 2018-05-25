id=ds-stage-03-rstudio
base_image=ds-stage-02-r:latest
container_name=ds_rstudio

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
	@echo "Access rstudio from localhost:8787"
push:
	$(MAKE) -C ../ id=$(id) base_image=$(base_image) push