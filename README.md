# splittestdemo

## Strategy for distinct unit and integration test execution in Go

### Problem

We want to run unit tests and integration tests separately. Unit tests should run fast and should not depend on external resources. Integration tests should run slower and should depend on external resources.

### Solution

For running unit tests we use the `go test ./...` command with the `-short` flag.

For running integration tests we use the `go test ./...` command without the `-short` flag and use `-run` to filter the tests starting with `TestIntegration`.

### Example

Will run only the unit tests.

```bash
$ go test -v -short ./...
```

```
=== RUN   TestBar
--- PASS: TestBar (0.00s)
PASS
ok  	github.com/alesr/splittestdemo/bar	(cached)
=== RUN   TestFoo
--- PASS: TestFoo (0.00s)
PASS
ok  	github.com/alesr/splittestdemo/foo	(cached)
=== RUN   TestIntegration_Qux
    qux_test.go:7: Skipping integration test in short mode
--- SKIP: TestIntegration_Qux (0.00s)
=== RUN   TestIntegration_Qux2
    qux_test.go:19: Skipping integration test in short mode
--- SKIP: TestIntegration_Qux2 (0.00s)
PASS
ok  	github.com/alesr/splittestdemo/foo/qux	(cached)
```


Will run only the integration tests.

```bash
$ go test -v ./... -run ^TestIntegration
```

```
testing: warning: no tests to run
PASS
ok  	github.com/alesr/splittestdemo/bar	(cached) [no tests to run]
testing: warning: no tests to run
PASS
ok  	github.com/alesr/splittestdemo/foo	(cached) [no tests to run]
=== RUN   TestIntegration_Qux
--- PASS: TestIntegration_Qux (0.00s)
=== RUN   TestIntegration_Qux2
--- PASS: TestIntegration_Qux2 (0.00s)
PASS
ok  	github.com/alesr/splittestdemo/foo/qux	(cached)
```

For convenience, we can create a Makefile with the following content:

```bash
$ make help
```

```
------------------------------------------------------------------------
splittestdemo
------------------------------------------------------------------------
test-it                        Run integration tests
test-unit                      Run unit tests
test                           Run unit and integration tests
```
