# make docker audit information

date +"%Y-%m-%d_%H-%M-%S" > $DOCKER_DIR/01_BUILD_DATE.var
echo $BASE_IMAGE > $DOCKER_DIR/02_BASE_IMAGE.var
echo $IMAGE_NAME > $DOCKER_DIR/03_IMAGE_NAME.var
echo $IMAGE_VERSION > $DOCKER_DIR/04_IMAGE_VERSION.var
echo $GIT_COMMIT > $DOCKER_DIR/05_GIT_COMMIT.var

#add docker info to a history file
echo -e '\n\n' >> $DOCKER_HISTORY
cat $DOCKER_DIR/*.var >> $DOCKER_HISTORY

#add docker info for this image to a file for R
echo "" > $DOCKER_INFO
echo "################################" >> $DOCKER_INFO
echo "# DOCKER BUILD INFORMATION" >> $DOCKER_INFO
echo -e "################################\n" >> $DOCKER_INFO
echo "This is docker image: ${IMAGE_NAME}:${IMAGE_VERSION}" >> $DOCKER_INFO
echo "Built from git commit: ${GIT_COMMIT}" >> $DOCKER_INFO
echo "See https://github.com/chapmandu2/datasci_docker/tree/${GIT_COMMIT} for Dockerfile code" >> $DOCKER_INFO
echo "See $DOCKER_HISTORY for provenance of this environment." >> $DOCKER_INFO
echo "See $DOCKER_DIR for more information" >> $DOCKER_INFO
echo -e "\n################################" >> $DOCKER_INFO
