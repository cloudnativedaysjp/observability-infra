LOKI_PLUGIN_NAME := loki
LOKI_PLUGIN_VERSION := 3.6.7
LOKI_PLUGIN_IMAGE := grafana/loki-docker-driver:$(LOKI_PLUGIN_VERSION)-amd64

.PHONY: upgrade-loki-plugin
upgrade-loki-plugin:
	docker plugin disable $(LOKI_PLUGIN_NAME) --force
	docker plugin upgrade $(LOKI_PLUGIN_NAME) $(LOKI_PLUGIN_IMAGE) --grant-all-permissions
	docker plugin enable $(LOKI_PLUGIN_NAME)
	sudo systemctl restart docker
