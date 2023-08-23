REGISTRY ?= ""
REGISTRY_PATH ?= ""
APP_NAME ?= tpm-device-plugin
IMAGE_VERSION ?= latest
IMAGE_PATH = ${REGISTRY}/${REGISTRY_PATH}/${APP_NAME}:${IMAGE_VERSION}

NAMESPACE ?= ""

.DEFAULT_GOAL = build

.PHONY: format
format:
	go fmt ./...
	$$GOPATH/bin/goimports -w $$(find . -name '*.go' -not -path '*/vendor/*')

.PHONY: build
build:
	mkdir -p build
	GO111MODULE=on \
	CGO_ENABLED=0 \
	go build -mod=vendor -o build/${APP_NAME} *.go

clean:
	rm build/${APP_NAME}

.PHONY: build-image
build-image:
	docker build . -t ${IMAGE_PATH}

.PHONY: clean-image
clean-image:
	docker rmi -f ${IMAGE_PATH}

.PHONY: push-image
push-image:
	docker push ${IMAGE_PATH}

# deploy targets

.PHONY: install
install:
	helm install --atomic --wait tpm-device-plugin ./chart \
		--namespace ${NAMESPACE} \
		--set image.repository=${REGISTRY}/${REGISTRY_PATH}/${APP_NAME} \
		--set image.tag=${IMAGE_VERSION}

.PHONY: uninstall
uninstall:
	helm uninstall --wait tpm-device-plugin \
		--namespace ${NAMESPACE}
