# Data Science R Container Stage 3: Rstudio install
# Set up a CentOS linux container with Rstudio installed

# use make for typical use : make help for options

# to build it : docker build -t ds-stage-03-rstudio \
#						--build-arg BASE_IMAGE=ds-stage-02-r \
#						--build-arg IMAGE_NAME=ds-stage-03-rstudio \
#						.

# to build it : docker build --tag="ds-stage-03-rstudio" .
# to run it : docker run --name="ds_rstudio" -d -p 60222:22 -p 8787:8787 ds-stage-03-rstudio
# to stop it : docker kill ds_rstudio
# to restart it : docker start ds_rstudio
# to launch bash session in it: docker exec -it ds_rstudio bash
# to delete it : docker rm ds_rstudio
# to remove the image : docker rmi ds-stage-03-rstudio
# NOTE: You must have built or pulled ds-stage-02-r prior to building this image!

ARG BASE_IMAGE=unspecified
FROM ${BASE_IMAGE}

#####################
#install and configure RStudio Server
#####################

RUN yum -y install \
	sudo \
	supervisor

#configure supervisord
ADD ./supervisord.conf /etc/supervisord.conf
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

#download and install rstudio
#include --no-check-certificate to avoid proxy issues
RUN wget --no-check-certificate https://download2.rstudio.org/rstudio-server-rhel-1.1.447-x86_64.rpm && \
    yum install -y --nogpgcheck rstudio-server-rhel-1.1.447-x86_64.rpm

RUN useradd rstudio \
  && echo "rstudio:rstudio" | chpasswd \
	&& chown rstudio:rstudio /home/rstudio

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
# expose ports and binding context
################

EXPOSE 22 8787
CMD ["/usr/bin/supervisord"]
