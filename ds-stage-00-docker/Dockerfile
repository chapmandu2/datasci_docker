# Data Science Container Stage 0: Docker dependencies
# Set up a CentOS linux container with docker specifics

# use make for typical use : make help for options
# to build it : docker build -t ds-stage-00-docker .
# to run it : docker run -it --name="ds00" ds-stage-00-docker
# to stop it : exit from shell
# to restart it : docker start -i ds00
# to delete it : docker rm ds00
# to remove the image : docker rmi ds-stage-00-docker
# to prep it ready for import : TO ADD
#

# the centos image will need to be imported from the dockerhub image maintained by centos

ARG BASE_IMAGE=unspecified
FROM ${BASE_IMAGE}

###############
# one off commands
###############

ENV DOCKER_DIR=/etc/docker
ENV DOCKER_INFO=${DOCKER_DIR}/docker_info.txt
ENV DOCKER_HISTORY=${DOCKER_DIR}/docker_build_history.txt

#make a directory for docker stuff
RUN mkdir -p -m 755 ${DOCKER_DIR}

#copy the shell file
COPY ./generate_docker_info.sh ${DOCKER_DIR}/

###############
# needs to be included in every build
###############

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
