# Status controller end-to-end testing

This end-to-end testing covers the Status controller's singleton status propagation feature.

## Test Coverage

The test suite includes:
1. Singleton status propagation - verifies that objects requesting singleton status reporting are correctly identified
2. Label-based selector matching - validates that objects without the status label are properly excluded
3. Integration with binding policies - ensures status objects work correctly with the KubeStellar binding system

## Running the tests

The status controller tests are part of the main Ginkgo test suite in `test/e2e/ginkgo/status_controller_test.go`.

You can run these tests using the general runner, as described in [the parent README](../README.md):

```shell
test/e2e/run-test.sh --env kind --test-type ginkgo
```

Alternatively, use the helper script for status tests specifically:

```shell
hack/run-e2e-status-test.sh --env kind
```

Or run the full Ginkgo suite directly with:

```shell
KFLEX_DISABLE_CHATTY=true ginkgo --vv --trace --no-color -- -skip-setup
```

To focus on status controller tests only, use Ginkgo's `--focus` parameter:

```shell
KFLEX_DISABLE_CHATTY=true ginkgo --vv --trace --no-color --focus "Status controller" -- -skip-setup
```

