SHELL=/bin/sh

export HOST_UID=$(shell id -u)
export HOST_GID=$(shell id -g)

DEV_DIR=.
SERVICE=

define down
	$(MAKE) down || $(MAKE) down
endef

define compose
	docker compose $(1)
endef

define run
	$(call compose,run --service-ports --rm $(SERVICE) $(1) && $(call down))
endef

.PHONY: init
init:
	scripts/init

.PHONY: down
down:
	$(call compose,down --remove-orphans)

.PHONY: up
up:
	$(call compose,up && $(call down))
