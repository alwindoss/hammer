# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_LOC=bin
MANNA_BINARY_NAME=hammer
PROJECT_HOME=$(shell pwd)

all: clean test build-ui generate build
build-ui:
	cd ui; yarn build; cp -rv dist ../
generate:
	statik -src=./dist
build: 
	$(GOBUILD) -o ./$(BINARY_LOC)/$(MANNA_BINARY_NAME) -v ./cmd/hammer/... 
test: 
	$(GOTEST) -v ./...
clean: 
	$(GOCLEAN)
	rm -rf $(BINARY_LOC)
	rm -rf dist
run: build
	./$(BINARY_LOC)/$(MANNA_BINARY_NAME)