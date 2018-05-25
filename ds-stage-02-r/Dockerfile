# Data Science R Container Stage 2: R dependencies
# Set up a CentOS linux container with R installed

# use make for typical use : make help for options

# to build it : docker build -t ds-stage-02-r \
#						--build-arg BASE_IMAGE=ds-stage-01-linux \
#						--build-arg IMAGE_NAME=ds-stage-02-r \
#						.
# to run it : docker run -it --name="ds02" ds-stage-02-r
# to stop it : exit from shell
# to restart it : docker start -i ds02
# to delete it : docker rm ds02
# to remove the image : docker rmi ds-stage-02-r
# NOTE: You must have built or pulled ds-stage-01-linux prior to building this image!

ARG BASE_IMAGE=unspecified
FROM ${BASE_IMAGE}

########################
#R library configuration
########################

RUN mkdir -p -m 755 /scratch/working/
RUN mkdir -p -m 755 /etc/R/
RUN echo "setwd('/scratch/working/')"  >> /etc/R/Rprofile.site
RUN ln -s /etc/R/Rprofile.site /usr/lib64/R/etc/
RUN R -e "dir.create(sprintf('/usr/share/doc/R-%s/html/', getRversion()))"

#modify the Rprofile.site file to display dockerfile information
RUN echo "message(paste(readLines('${DOCKER_INFO}'), '\n'));" >> /etc/R/Rprofile.site

#add some R packages - note that tidyverse packages take long time to compile!
RUN R -e "install.packages(c('rpart', 'zoo'), repos='http://cran.r-project.org')"

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
