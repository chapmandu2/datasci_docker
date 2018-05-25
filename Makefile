IMAGE_NAME = $(id)
BASE_IMAGE = $(base_image)

#check image id specified
ifeq ("$(id)", "")
$(error id not specified, needs to be one of the subdirectories here)
endif

#check base image specified
ifeq ("$(base_image)", "")
$(error base_image not specified)
endif

#check container name specified
ifeq ("$(container_name)", "")
	CONTAINER_NAME = test
else
	CONTAINER_NAME = $(container_name)
endif


#check image subdir exists
ifeq ("$(shell ls | grep '$(id)')", "")
$(error specified id $(id) does not exit as a subdirectory)
endif

#get the latest git commit
GIT_COMMIT := $(shell git log -1 --format=%h)

#get the image version from the git tag of the latest commit
GIT_TAG := $(shell git tag -l --points-at HEAD)

#check that the git commit is tagged
ifeq ("$(GIT_TAG)", "")
	IMAGE_VERSION = notag
else
	IMAGE_VERSION = $(GIT_TAG)
endif

#Amazon ECR
ECR_NAME = your-ecr-id.dkr.ecr.eu-west-2.amazonaws.com
ECR_PATH = $(ECR_NAME)/$(IMAGE_NAME)

help:
	@echo Makefile commands:
	@echo
	@echo help: print this help message and exit
	@echo build: build the docker image
	@echo run: run the docker image
	@echo push: push the built docker image to ECR


test:
	@echo "$(ECR_PATH)"
	@echo "$(base_image)"
	@echo "$(container_name)"


build:
	cd $(IMAGE_NAME)
	docker build -t $(IMAGE_NAME) \
	-t $(IMAGE_NAME):$(GIT_COMMIT) \
	--build-arg BASE_IMAGE=$(BASE_IMAGE) \
	--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	--build-arg IMAGE_VERSION=$(IMAGE_VERSION) \
	--build-arg GIT_COMMIT=$(GIT_COMMIT) \
	$(IMAGE_NAME)

run:
	docker run -it --rm $(IMAGE_NAME):$(GIT_COMMIT)

run-server:
	docker run --name="$(CONTAINER_NAME)" \
		-d -p 60222:22 -p 8787:8787 \
		$(IMAGE_NAME):$(GIT_COMMIT)

ifeq ("$(IMAGE_VERSION)", "notag")
push:
	@echo "Error: Git commit for current image has no git tag"
else
push:
	@echo "Git commit for current image has been tagged.  Push image to ECR."
	docker tag $(IMAGE_NAME):$(GIT_COMMIT) $(IMAGE_NAME):$(IMAGE_VERSION)
	docker tag $(IMAGE_NAME):$(GIT_COMMIT) $(ECR_PATH):latest
	docker tag $(IMAGE_NAME):$(GIT_COMMIT) $(ECR_PATH):$(GIT_COMMIT)
	docker tag $(IMAGE_NAME):$(GIT_COMMIT) $(ECR_PATH):$(IMAGE_VERSION)
	@echo "docker push $(ECR_NAME)/$(IMAGE_NAME):latest"
	@echo "docker push $(ECR_NAME)/$(IMAGE_NAME):$(GIT_COMMIT)"
	@echo "docker push $(ECR_NAME)/$(IMAGE_NAME):$(IMAGE_VERSION)"
endif


