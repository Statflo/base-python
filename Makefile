VERSION=stable
IMAGE_TAG=181017921891.dkr.ecr.us-east-1.amazonaws.com/base-python:$(VERSION)
TEMPORARY_TAG=base-python:$(VERSION)
TEMPORARY_EXPORT_PATH=$(VERSION).hdd

build-uncompressed-image:
	docker build -t $(IMAGE_TAG) $(VERSION)

build-compressed-image: build-temporary-image compress-image
	@echo "Done"

build-temporary-image:
	@echo "Building the image..."
	docker build -t $(TEMPORARY_TAG) $(VERSION)

push:
	docker push $(IMAGE_TAG)

compress-image:
	@echo "Compressing the image virtual size..."
	sandbox_id=`docker run -d $(TEMPORARY_TAG)`; \
		docker export -o $(TEMPORARY_EXPORT_PATH) $$sandbox_id && docker import $(TEMPORARY_EXPORT_PATH) $(IMAGE_TAG); \
		docker rm -f $$sandbox_id
	docker tag -f $(TEMPORARY_TAG) $(IMAGE_TAG)
	docker rmi $(TEMPORARY_TAG)
	rm $(TEMPORARY_EXPORT_PATH)

terminal:
	docker run -i -t --rm $(TAG)
