#!/bin/bash

# Specify the container name
container_name="c1"

# Check if the container is running
if docker ps --filter "name=$container_name" --format "{{.Names}}" | grep -wq "$container_name"; then
  echo "The container '$container_name' is running."
  echo "Stopping and removing the container..."
  
  # Stop and remove the container
  docker stop "$container_name" && docker rm "$container_name"
  
  echo "The container '$container_name' has been deleted."
else
  echo "The container '$container_name' is not running."
fi


###  Build new docker image withe latest 

docker build -t myimage .

docker run -itd -p 80:80 --name c1 myimage
