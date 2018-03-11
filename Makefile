DOCKER_IMAGE ?= kesor/avr-toolchain

default: docker_build

docker_build:
	@docker build \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		--build-arg BUILD_DATE=`date -uIs | sed -e 's!\+.*!Z!g'` \
		-t $(DOCKER_IMAGE) .

docker_push:
	docker push $(DOCKER_IMAGE)
