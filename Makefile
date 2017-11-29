all: run

#### VARIABLES ####
image_name ?= tf_graph_inverter
user_name ?= $(shell whoami | tr '[A-Z]' '[a-z]')
app_name ?= tf_graph_inverter

script_file =

py_version ?= 3.6.2
app_version ?= 0.0.2

git_hash = $(shell git rev-parse HEAD | cut -c 1-6)
build_date = $(shell date -u '+%Y-%m-%d_%I:%M:%S%p')

.PHONY: build run

#### COMMANDS ####
build:
	$(call blue, "# Building Python App...")
	docker build --label APP_VERSION=${app_version} --label BUILT_ON=${build_date} --label GIT_HASH=${git_hash} -t ${user_name}/${image_name} .

run:
	$(call blue, "# Running Python App...")
	docker run --rm --name ${image_name} -v "$(CURDIR)":/src/app/ -w /src/app ${user_name}/${image_name} python ${app_name}.py --file ${script_file}

#### FUNCTIONS ####
define blue
	@tput setaf 4
	@echo $1
	@tput sgr0
endef
