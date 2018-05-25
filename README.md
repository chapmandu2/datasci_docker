# Introduction



# Instructions

## Warning

Building these docker images from scratch requires time to both download packages from the internet and compile them.  If you have a slow network connection building from scratch will take a LOOOONG time!  Find somewhere with a decent network connection before you start!  Once you have built the image once however, it is cached and rebuilding will re-use previously cached components of the build.

## Quick start

Build the minimal_centos7 docker image:

`docker build /path/to/minimal_centos7 --tag='minimal_centos7'`

Then run a container based on the image as follows:

`docker run -it minimal_centos7`

This drops you into a bash prompt within the docker container.  How you interact with the docker container depends on how it is configured so look at the Dockerfile for further instructions!

If you exit you can see available docker containers with:

`docker ps -a`

Get back into an existing container with:

`docker start -i <name_of_container>`

For more information see the [Docker documentation](https://docs.docker.com)

## Data Science Images

This git repository contains a number of Dockerfiles specifying images for the Data Science environments.  Each image builds on the previous one starting with the linux libraries, then R libraries, then R studio.  Finally an additional build can add on custom libraries for project specific requirements.

In general run a container as follows:

`docker run --name="<container_name>" -d -p 8787:8787 <image_name>`

Detailed instructions for building the docker images and using them can be found in the comments for each Dockerfile, but it is advised to use `make` as described in the next section.

### Makefiles

Each image has its own Makefile which can be used to build, run and also push the built image to the Elastic Container Repository (see below).  Note that this Makefile references a master Makefile in the `datasci_docker` directory.  See `make help` for details.  Broadly:
	- `make build` builds the image
	- `make run` runs the image

### Audit trail

The default build commands as specified by the Makefiles allow an audit trail to be built up of how an image is constructed.  See `/etc/docker/` on the built image for more information.

### Accessing host data in container

Use the `-v` tag in docker run, the general case is:

`-v /path/on/host:/path/on/container`

So to map the Documents directory on a mac to /home/rstudio/hostdata would be:

`-v ~/Documents:/home/rstudio/hostdata`

### Specifying computational resources

By default Docker will only have access to one CPU and 2GB memory.  To increase this on the Mac go to Docker for Mac/Preferences/Advanced.

By default a docker container will have access to all CPUs available to Docker itself.  To limit CPUs available use the `--cpus` tag in docker run:

`--cpus="2"`

By default a docker container will have access to all memory available to Docker itself.  To limit memory use the `-m` tag in docker run:

`-m 3G`

For more information see:

https://docs.docker.com/engine/admin/resource_constraints/#


