# PlatformTM-docker

The purpose of this project is to provide a straigtforward way of deploying a full PlatformTM stack through docker-compose.

## Prerequisites

We assume you already have installed `docker-engine` on your server. Furthermore we assume you have checked out the `docker` branches of both the `PlatformTM-server` and `PlatformTM-web` repositories. In these branches of the repositories you will find a `create_image.sh` script. Please run this script in order to build the images and add them to your local repository. After running these scripts you will have two new images in your repository called `platform-tm/platform-tm-server` and `platform-tm/platform-tm-web`.

## Usage

The aforementioned images depend on each other but also on other services. The `docker-compose.yml` file contains all configuration related to linking the services and mounting files into the containers. Assuming you have completed the prerequisites, it should be sufficient to run `docker-compose up -d` in this directory to start the complete PlatformTM stack. Point your browser to `localhost:8889` to connect to the frontend.


The containers are configured to restart automatically unless stopped explicitly. This means the PlatformTM stack will start up on system start up, and services will restart automatically should they crash due to whatever reason. You can follow the log messages of the containers by running `docker-compose logs -f`. Using the `-f` option makes sure compose 'follows' the log output as new messages are logged.

## Configuration
Nginx is used to serve the static files of the frontend. The same Nginx server is used as a proxy to the backend through the `/api/` location. By default, the frontend is served through port 8889. You can modify this by locating the `ports` section in the `platform-tm-web` section of `docker-compose.yml`. Change the value of 8889 to whatever port you want to serve on.

