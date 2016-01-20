build-image:
	docker build -t base-python .

terminal:
	docker run -i -t --rm base-python
