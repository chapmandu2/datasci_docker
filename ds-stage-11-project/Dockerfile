# Data Science R Container Stage 11: Package install project

# use make for typical use : make help for options

# to build it : docker build -t ds-stage-11-project \
#						--build-arg BASE_IMAGE=ds-stage-03-rstudio \
#						--build-arg IMAGE_NAME=ds-stage-11-project \
#						.

# to run it : docker run --name="ds_rstudio_proj" -d -p 60222:22 -p 8787:8787 ds-stage-11-project
# to stop it : docker kill ds_rstudio_proj
# to restart it : docker start ds_rstudio_proj
# to launch bash session in it: docker exec -it ds_rstudio_proj bash
# to delete it : docker rm ds_rstudio_proj
# to remove the image : docker rmi ds-stage-11-project

# NOTE: You must have built or pulled ds-stage-03-rstudio prior to building this image!

ARG BASE_IMAGE=unspecified
FROM ${BASE_IMAGE}

#####################
#install linux dependencies for project
#####################

#extra project package linux dependencies
RUN yum -y install libpng-devel

####################
#install R packages
####################

#packages for project
RUN R -e "install.packages(c('png'), repos='http://cran.r-project.org')"

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

# No need for EXPOSE or CMD as inherits from ds-stage-03-rstudio

