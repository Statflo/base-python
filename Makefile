VERSION=latest
IMAGE_TAG=181017921891.dkr.ecr.us-east-1.amazonaws.com/base-python:$(VERSION)
TEMPORARY_TAG=base-python:$(VERSION)
TEMPORARY_EXPORT_PATH=$(VERSION).hdd

build-image:
	docker build -t $(IMAGE_TAG) $(VERSION)
	@echo "The image is ready for the push. Run 'make push' to do so."

push:
	docker push $(IMAGE_TAG)

terminal:
	docker run -i -t --rm $(TAG)
