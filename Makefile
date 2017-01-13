VERSION=latest
NAMESPACE=statflo
IMAGE_BASE_TAG=$(NAMESPACE)/base-python
IMAGE_TAG=$(IMAGE_BASE_TAG):$(VERSION)

build-push-all:
	make VERSION=latest build push

build:
	@docker build $(BUILD_EXT) -t $(IMAGE_TAG) $(VERSION)
	@echo ""
	@echo "The image is ready for the push. Run 'make push' to do so."

clean:
	docker rmi -f $(IMAGE_TAG)
	@echo ""
	@echo "The image is removed."

push:
	@docker push $(IMAGE_TAG)

terminal:
	@docker run -i -t --rm $(TAG)

all:
	# make BUILD_EXT=$(BUILD_EXT) VERSION=v1   build push  # Frozen build
	# make BUILD_EXT=$(BUILD_EXT) VERSION=v2   build push  # Frozen build
	# make BUILD_EXT=$(BUILD_EXT) VERSION=slim build push  # Frozen build
	make BUILD_EXT=$(BUILD_EXT) VERSION=latest build push

	@#Tag "v2" as "stable"
	docker pull $(IMAGE_BASE_TAG):v2
	docker tag $(IMAGE_BASE_TAG):v2 $(IMAGE_BASE_TAG):stable
	docker push $(IMAGE_BASE_TAG):stable

	@#Tag "latest" as "v3"
	docker tag $(IMAGE_BASE_TAG):latest $(IMAGE_BASE_TAG):v3
	docker push $(IMAGE_BASE_TAG):v3
