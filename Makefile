GO ?= go

all: install vet lint test

install: go.mod
	$(GO) mod download
lint: install
	./scripts/lint.sh
vet: install
	$(GO) vet ./...
test: install
	$(GO) test -v -covermode=count -coverprofile=coverprofile.out ./...
test-race:
	$(GO) test --race ./...
clean:
	rm -f coverprofile.out
.PHONY: all install lint vet test test-race clean