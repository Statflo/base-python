VERSION=latest
IMAGE_TAG=statflo/base-python:$(VERSION)

build:
	docker build --no-cache -t $(IMAGE_TAG) $(VERSION)
	@echo ""
	@echo "The image is ready for the push. Run 'make push' to do so."

clean:
	docker rmi -f $(IMAGE_TAG)
	@echo ""
	@echo "The image is removed."

push:
	docker push $(IMAGE_TAG)

terminal:
	docker run -i -t --rm $(TAG)
