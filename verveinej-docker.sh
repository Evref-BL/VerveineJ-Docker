#!/bin/bash
JAVA_XMX_OPTION=${JAVA_XMX:--Xmx2G}
JAVA_OPTIONS=()
VERVEINEJ_OPTIONS=("$@")

for argument in "$@"; do
    if [[ "$argument" == "--" ]]; then
        while [[ "$1" != "--" ]]; do
            JAVA_OPTIONS+=("$1")
            shift
        done
        shift
        VERVEINEJ_OPTIONS=("$@")
        break
    fi
done

exec java "$JAVA_XMX_OPTION" "${JAVA_OPTIONS[@]}" -jar /VerveineJ.jar "${VERVEINEJ_OPTIONS[@]}" -autocp /dependency .
