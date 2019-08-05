GO ?= go

install: go.mod
	$(GO) mod download
lint: install
	./scripts/lint.sh
test: install
	$(GO) test -v -covermode=count -coverprofile=coverprofile.out ./...
test-race:
	$(GO) test --race ./...
clean:
	rm -f coverprofile.out
.PHONY: install test lint test-race clean