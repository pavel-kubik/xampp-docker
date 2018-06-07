IMAGE_NAME=pavel-kubik/xampp
CONTAINER_NAME=xampp-docker
PUBLIC_WWW_DIR='~/web_pages'


echo "Running container '$CONTAINER_NAME' from image '$IMAGE_NAME'..."

docker start $CONTAINER_NAME > /dev/null 2> /dev/null || {
	echo "Creating new container..."
	docker run -ti --rm\
	       --detach \
	       --tty \
	       -p 8086:80 \
	       -p 3386:3306 \
	       -p 8021:21 \
               -e DISPLAY=$DISPLAY \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
	       --name $CONTAINER_NAME \
	       --mount "source=$CONTAINER_NAME-vol,destination=/opt/lampp/var/mysql/" \
			$IMAGE_NAME
}

if [ "$#" -eq  "0" ]; then
	docker exec --interactive --tty $CONTAINER_NAME bash
elif [ "$1" = "stop" ]; then
	docker stop $CONTAINER_NAME
else
	docker exec $CONTAINER_NAME $@
fi

