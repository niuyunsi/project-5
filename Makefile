NO_COLOR=\033[0m
OK_COLOR=\033[32m

all: build heroku

build:
	@echo "$(OK_COLOR)>>>>>>>>>>BUILDING FRONTEND CLIENT>>>>>>>>>>$(NO_COLOR)"
	@yarn run build

heroku:
	@echo "$(OK_COLOR)>>>>>>>>>>BUILDING AND PUSHING TO HEROKU CONTAINER REGISTRY>>>>>>>>>>$(NO_COLOR)"
	@heroku container:push web
	@echo "$(OK_COLOR)>>>>>>>>>>RELEASING>>>>>>>>>>$(NO_COLOR)"
	@heroku container:release web

say_hello:
	@echo "$(OK_COLOR)Hello World$(OK_COLOR)"

.PHONY: build
