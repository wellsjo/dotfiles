.DEFAULT_GOAL := help

help: ## Show help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup-interactive: ## Setup portable baseline interactively
	bash setup

setup: ## Setup portable baseline
	bash setup --force

setup-full-interactive: ## Setup Wells full environment interactively
	bash setup --full

setup-full: ## Setup Wells full environment
	bash setup --full --force

.PHONY: help \
	setup-interactive \
	setup \
	setup-full-interactive \
	setup-full
