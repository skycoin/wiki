.DEFAULT_GOAL := help

deploy: ##Deploys the project to the github pages.
	git switch main
	git pull
	mkdocs gh-deploy

serve: ##Builds the document.
	mkdocs serve

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'