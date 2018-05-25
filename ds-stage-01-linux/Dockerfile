# Data Science Linux Container Stage 1: Linux dependencies
# Set up a CentOS linux container with required dependencies

# use make for typical use : make help for options
# to build it : docker build -t ds-stage-01-linux \
#						--build-arg BASE_IMAGE=ds-stage-00-docker \
#						--build-arg IMAGE_NAME=ds-stage-01-linux \
#						.
# to run it : docker run -it --name="ds01" ds-stage-01-linux
# to stop it : exit from shell
# to restart it : docker start -i ds01
# to delete it : docker rm ds01
# to remove the image : docker rmi ds-stage-01-linux
# to prep it ready for import : TO ADD
#

# NOTE: You must have built or imported ds-stage-01-linux prior to building this image!

ARG BASE_IMAGE=unspecified
FROM ${BASE_IMAGE}

#######################
#linux libraries install section
#######################

RUN yum -y update; yum clean all

RUN yum -y install epel-release; yum clean all

RUN yum -y install \
	R \
	build-essential \
	ca-certificates \
	gcc \
	git \
	libcurl-devel \
	libsm6 \
	libxml2-devel \
	make \
	nano \
	openssh-clients \
	openssh-server \
	openssl-devel \
	passwd \
	unzip \
	vim \
	wget; yum clean all


#######################
# audit section
#######################

ARG BASE_IMAGE=unspecified
ARG IMAGE_NAME=unspecified
ARG IMAGE_VERSION=unspecified
ARG GIT_COMMIT=unspecified

LABEL image_version=$IMAGE_VERSION
LABEL git_commit=$GIT_COMMIT

#run the shell file
RUN sh ${DOCKER_DIR}/generate_docker_info.sh

################
# default binding context
################

CMD ["bash"]
