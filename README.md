[![GitHub license](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/Bikeemotion/CentOS/blob/master/LICENSE)

# About

Dockerfile to build our [CentOS](https://www.centos.org/) baseimage

The image is built on top of the official [Docker CentOS image](https://hub.docker.com/_/centos/) and installs the following extra packages:

- `bind-utils`
- `centos-release-scl-rh`
- `epel-release`
- `gettext`
- `iproute`
- `sudo`
- `which`

Additionally we did the following configurations:

- `Yum` is configured to **NOT** install any file in `/usr/share/doc` and to force `en_US.utf8` as the default locale.
- we added [EPEL](https://fedoraproject.org/wiki/EPEL) and [Software Collections](https://www.softwarecollections.org/en/) to Yum Repositories
- all scripts (for configuration and start of PID 1) go to `/usr/share/container_scripts`

# Usage

At this momment if you want to use this image, you will have to build the image yourself using a Linux machine (we use bash in our scripts):

1. define the variables that will be used in your build (you can see the template file environment_variables.tmpl)

```bash
cd scripts
cp environment_variables.tmpl environment_variables.temp
vi environment_variables.temp
```

| Variable name | Description | Examples
--- | --- | --- 
FROM_DOCKERFILE_TAG | the tag that will be used when pulling the official Docker CentOS image | :7
REGISTRY | to which docker registry [registry/][username/] you are going push the image if any. In the case that you only want to use it locally you can use the username part (you shouldn't leave empty so it doesn't collide with upstream centos image) | quay.io/bikeemotion/
IMAGE_TAG | the tag of the builded image | :1.0

2. build the image itself

```bash
./rebuild.sh
```

3. start the container

```bash
./start-centos.sh.temp
```
