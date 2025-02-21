IMAGE_NAME := jupyter
TAG := latest
PORT ?= 8899
NOTEBOOKS_DIR ?= ./notebooks

build:
	docker build -t $(IMAGE_NAME):$(TAG) .

run:
	if [ ! -d "$(NOTEBOOKS_DIR)" ]; then \
		mkdir -p $(NOTEBOOKS_DIR); \
	fi
	docker run -e PORT=$(PORT) -p $(PORT):$(PORT) -v $(NOTEBOOKS_DIR):/home/user/notebooks -it --rm $(IMAGE_NAME):$(TAG)
