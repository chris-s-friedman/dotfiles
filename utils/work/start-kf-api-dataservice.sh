#!/bin/bash
#Open Docker, only if is not running
if (! docker stats --no-stream ); then
  #Start Docker
  open --hide --background -a Docker
 #Wait until Docker daemon is running and has completed initialisation
while (! docker stats --no-stream ); do
  # Docker takes a few seconds to initialize
  echo "Waiting for Docker to launch..."
  sleep 1
done
fi

#Start the Container..
docker-compose --file ~/Documents/kf-api-dataservice/docker-compose.yml up -d 
