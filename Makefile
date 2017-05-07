USER = dpollet
REPO = texlive
DIR ?= base
TAG ?= $(DIR)

.phony: build all image-base image-full image-pillar

build :
	docker build --tag $(USER)/$(REPO):$(TAG) $(DIR)

all : image-base image-full image-pillar
image-full : | image-base
image-pillar : | image-full

image-base image-full image-pillar :
	make build -e DIR=$(@:image-%=%)
