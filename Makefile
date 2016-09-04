VERSION=latest
NAMESPACE=statflo
#NAMESPACE=181017921891.dkr.ecr.us-east-1.amazonaws.com
IMAGE_TAG=$(NAMESPACE)/base-python:$(VERSION)

build-push-all:
	make VERSION=latest build push

build:
	@docker build --no-cache -t $(IMAGE_TAG) $(VERSION)
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
	make VERSION=latest build push
	make VERSION=v1 build push
	make VERSION=slim build push
