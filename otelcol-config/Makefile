SHELL=/bin/bash

.PHONY: help
help:
	@awk -F':.*##' '/^[-_a-zA-Z0-9]+:.*##/{printf"%-12s\t%s\n",$$1,$$2}' $(MAKEFILE_LIST) | sort

.PHONY: generate-otelcol
generate-otelcol: ## Generate the OpenTelemetry Collector code without building it
	docker buildx build -t ocb:latest .
	docker run --rm -it -v $(shell pwd):/mnt ocb:latest ocb --config builder-config.yaml --skip-compilation

.PHONY: build
build: ## Build the OpenTelemetry Collector
	docker buildx build -t ocb:latest .
	docker run --rm -it -v $(shell pwd):/mnt ocb:latest ocb --config builder-config.yaml --skip-generate

.PHONY: lint
lint: ## Lint the code
	hadolint Dockerfile
	yamllint .yamllint *.yaml
