# Enable exit on non 0
set -e

CONTAINER_NAME=simple-proxy

docker stop ${CONTAINER_NAME} || true
docker rm ${CONTAINER_NAME} || true
docker rmi -f ${CONTAINER_NAME} || true