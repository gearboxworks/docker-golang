![nginx 1.15.x](https://img.shields.io/badge/nginx-1.15.x-green.svg)
![nginx 1.14.x](https://img.shields.io/badge/nginx-1.14.x-green.svg)
![nginx 1.13.x](https://img.shields.io/badge/nginx-1.13.x-green.svg)
![nginx 1.12.x](https://img.shields.io/badge/nginx-1.12.x-green.svg)

![Gearbox](https://github.com/gearboxworks/gearbox.github.io/raw/master/Gearbox-100x.png)


# nginx Docker Container for Gearbox
This is the repository for the [nginx](https://nginx.org/en/) Docker container implemented for [Gearbox](https://github.com/gearboxworks/gearbox).
It currently provides versions 1.12.x 1.13.x 1.13.x


## Supported tags and respective Dockerfiles

`1.15.9`, `1.15`, `latest` _([1.15.9/Dockerfile](https://github.com/gearboxworks/nginx-docker/blob/master/1.15.9/Dockerfile))_

`1.14.2, `1.14`` _([1.14.2/Dockerfile](https://github.com/gearboxworks/nginx-docker/blob/master/1.14.2/Dockerfile))_

`1.13.12`, `1.13` _([1.13.12/Dockerfile](https://github.com/gearboxworks/nginx-docker/blob/master/1.13.12/Dockerfile))_

`1.12.2, `1.12`` _([1.12.2/Dockerfile](https://github.com/gearboxworks/nginx-docker/blob/master/1.12.2/Dockerfile))_


## Using this container.
If you want to use this container as part of Gearbox, then use the Docker Hub method.
Or you can use the GitHub method to build and run the container.


## Using it from Docker Hub

### Links
(Docker Hub repo)[https://hub.docker.com/r/gearbox/nginx/]

(Docker Cloud repo)[https://cloud.docker.com/swarm/gearbox/repository/docker/gearbox/nginx/]


### Setup from Docker Hub
A simple `docker pull gearbox/nginx` will pull down the latest version.


### Runtime from Docker Hub
start - Spin up a Docker container with the correct runtime configs.

`docker run -d --name nginx-1.13.12 --restart unless-stopped --network gearboxnet -p 8080:80 -v $PROJECT_ROOT:/project gearbox/nginx:1.13.12`

stop - Stop a Docker container.

`docker stop nginx-1.13.12`

run - Run a Docker container in the foreground, (all STDOUT and STDERR will go to console). The Container be removed on termination.

`docker run --rm --name nginx-1.13.12 --network gearboxnet -p 8080:80 -v $PROJECT_ROOT:/project gearbox/nginx:1.13.12`

shell - Run a shell, (/bin/bash), within a Docker container.

`docker run --rm --name nginx-1.13.12 -i -t --network gearboxnet -p 8080:80 -v $PROJECT_ROOT:/project gearbox/nginx:1.13.12 /bin/bash`

rm - Remove the Docker container.

`docker container rm nginx-1.13.12`


## Using it from GitHub repo

### Setup from GitHub repo
Simply clone this repository to your local machine

`git clone https://github.com/gearboxworks/nginx-docker.git`


### Building from GitHub repo
`make build` - Build Docker images. Build all versions from the base directory or specific versions from each directory.


`make list` - List already built Docker images. List all versions from the base directory or specific versions from each directory.


`make clean` - Remove already built Docker images. Remove all versions from the base directory or specific versions from each directory.


`make push` - Push already built Docker images to Docker Hub, (only for Gearbox admins). Push all versions from the base directory or specific versions from each directory.


### Runtime from GitHub repo
When you `cd` into a version directory you can also perform a few more actions.

`make start` - Spin up a Docker container with the correct runtime configs.


`make stop` - Stop a Docker container.


`make run` - Run a Docker container in the foreground, (all STDOUT and STDERR will go to console). The Container be removed on termination.


`make shell` - Run a shell, (/bin/bash), within a Docker container.


`make rm` - Remove the Docker container.


`make test` - Will issue a `stop`, `rm`, `clean`, `build`, `create` and `start` on a Docker container.


