TAG=base-python
VERSION=stable

build-image:
	docker build -t $(TAG) $(VERSION)

terminal:
	docker run -i -t --rm $(TAG)
