IMAGE_NAME=mssoftware/workspace
IMAGE_VERSION=latest
IMAGE_TAG=$IMAGE_NAME:$IMAGE_VERSION

docker build . --tag=$IMAGE_TAG
docker push $IMAGE_TAG
