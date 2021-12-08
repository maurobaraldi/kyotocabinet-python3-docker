CODE_VERSION = $(strip $(shell cat VERSION))
GIT_COMMIT = $(strip $(shell git rev-parse --short HEAD))
DOCKER_IMAGE ?= maurobaraldi/kyotocabinet-python
DOCKER_TAG = $(CODE_VERSION)

build:
	docker build \
  --build-arg VCS_URL=`git config --get remote.origin.url` \
  --build-arg VCS_REF=$(GIT_COMMIT) \
  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	-t $(DOCKER_IMAGE):$(DOCKER_TAG) .

push:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
