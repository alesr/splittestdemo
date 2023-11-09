.PHONY: test
test: test-unit test-it

.PHONY: test-unit
test-unit:
	go test -v -short ./...

.PHONY: test-it
test-it:
	go test -v ./... -run ^TestIntegration$
