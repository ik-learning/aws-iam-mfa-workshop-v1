.PHONY: terraform terraform-docs

help: ## Show available targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

terraform: ## create workspace in AWS
	@bin/terraform.sh apply