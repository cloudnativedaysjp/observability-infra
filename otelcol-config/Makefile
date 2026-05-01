SHELL=/bin/bash

.PHONY: help
help:
	@awk -F':.*##' '/^[-_a-zA-Z0-9]+:.*##/{printf"%-12s\t%s\n",$$1,$$2}' $(MAKEFILE_LIST) | sort

.PHONY: generate-otelcol
generate-otelcol: ## Generate the OpenTelemetry Collector code without building it
	go mod download && go mod tidy && go generate ./...

.PHONY: build
build: ## Build the OpenTelemetry Collector
	(cd otelcol && go build -o otelcol .)

.PHONY: lint
lint: ## Lint the code
	yamllint .*.yaml *.yaml ../*/otelcol/otelcol-o11y-stack-config.yaml
	MACKEREL_APIKEY='dummy' otelcol/otelcol validate --config ../prod/otelcol/otelcol-o11y-stack-config.yaml
	MACKEREL_APIKEY='dummy' otelcol/otelcol validate --config ../stg/otelcol-config/otelcol-o11y-stack-config.yaml
