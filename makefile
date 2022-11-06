.PHONY: help

help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

up: ## run docker-compose.yml
	docker-compose up
up-d: ## run containers in the background
	docker-compose up
down: ## remove container and network
	docker-compose down
down-v: ## remove container, network and volumes 
	docker-compose down -v
getssl: ## check if certbot was successfull
	docker-compose exec webserver ls -la /etc/letsencrypt/live	

