#!/bin/bash
# Run e2e test for singleton status controller
# Requires: kind clusters (WDS + ITS) set up via test/e2e/run-test.sh
# Usage: ./hack/run-e2e-status-test.sh [--env kind|ocp] [--fail-fast]

set -e

env="${1:-kind}"
fail_flag=""

if [[ "$2" == "--fail-fast" ]]; then
    fail_flag="--fail-fast"
fi

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SRC_DIR/.." && pwd)"
cd "$REPO_ROOT"

echo "Running e2e singleton status propagation test..."
echo "Environment: $env"
echo ""

# Use the existing e2e harness
test/e2e/run-test.sh --env "$env" --test-type ginkgo $fail_flag
