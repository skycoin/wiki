.DEFAULT_GOAL := help

deploy: ## Deploys the project to the github pages.
	git switch main
	git pull
	mkdocs gh-deploy

serve: ## Builds the document.
	mkdocs serve

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
