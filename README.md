## xampp-docker

Docker image containg the latest XAMPP 7.2.4.

The install.js script is a temporary workaround for building XAMPP in docker.  
Note: This image was built for development purposes.

## Getting the image:

The image has been pushed to [Dockerhub](https://hub.docker.com/r/cswl/xampp/)  
So you can just:

```
docker pull cswl/xampp
```

## Running the image:

For convience, an startup script is provided.  
Edit the startup script if you want to give the container a different name.

This image uses /www directory for your page files, so you need to specify the volume mount it.
Your webpage will be served at: http://localhost:8086/www  
And to open up the XAMPP interface: http://localhost:8086/  
The MySQL port is also exposed at at mysql://localhost:3086

All the XAMPP services are started by default.
To startup a bash shell. Just run the startup script without arguments.


## Building the image from source.:

First, clone this project.

```
$ git clone https://github.com/cswl/xampp-docker.git
```

Second, change directory to the just now cloned repository.

```
$ docker build -t cswl/xampp .
```

## Show FTP config gui in hosting system

Run
```
gadmin-proftp
```
in docker. To accept Xwindows connection on host, run
```
xhost +
```
on docker host system.

https://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0

## License

The scripts and Dockerfile are licensed under the GPL-3.0 license.

The Dockerfile was made with refrences from :

[tomsik68/docker-xampp](https://github.com/tomsik68/docker-xampp) unlicensed and [fuyuanli/Dockerfile-XAMPP](https://github.com/fuyuanli/Dockerfile-XAMPP) which is licensed under GPL v3.0.
