.DEFAULT_GOAL := help

PROJECT_NAME := splittestdemo

.PHONY: help
help:
	@echo "------------------------------------------------------------------------"
	@echo "${PROJECT_NAME}"
	@echo "------------------------------------------------------------------------"
	@grep -E '^[a-zA-Z0-9_/%\-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: test 
test: ## Run unit and integration tests
	go test -v ./...

.PHONY: test-unit 
test-unit: ## Run unit tests
	go test -v -short ./...

.PHONY: test-it
test-it: ## Run integration tests
	go test -v ./... -run ^TestIntegration$
