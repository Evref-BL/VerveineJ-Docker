#!/usr/bin/env bash
set -euo pipefail

test_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
chmod +x "$test_dir/bin/java"

run_entrypoint() {
    PATH="$test_dir/bin:$PATH" JAVA_XMX=-Xmx2G bash "$test_dir/../verveinej-docker.sh" "$@"
}

assert_arguments() {
    local description=$1
    local actual=$2
    local expected=$3

    if [[ "$actual" != "$expected" ]]; then
        echo "$description produced unexpected Java arguments" >&2
        diff -u <(printf '%s\n' "$expected") <(printf '%s\n' "$actual") >&2 || true
        exit 1
    fi
}

assert_arguments "VerveineJ options" \
    "$(run_entrypoint -format json -o 'model output.json')" \
    $'-Xmx2G\n-jar\n/VerveineJ.jar\n-format\njson\n-o\nmodel output.json\n-autocp\n/dependency\n.'

assert_arguments "Java options before separator" \
    "$(run_entrypoint -Xmx64m -Dexample='value with spaces' -- -format json)" \
    $'-Xmx2G\n-Xmx64m\n-Dexample=value with spaces\n-jar\n/VerveineJ.jar\n-format\njson\n-autocp\n/dependency\n.'
