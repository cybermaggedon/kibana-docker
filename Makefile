
VERSION=5.4.0a

all: container

container:
	docker build -t cybermaggedon/kibana:${VERSION} .

push: container
	docker push cybermaggedon/kibana:${VERSION}

