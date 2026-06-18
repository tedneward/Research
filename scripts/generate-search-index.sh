#!/bin/bash
# Generate searchindex.json from the baked searchindex page

BAKE_OUTPUT="${1:-build/jbake}"

if [ -f "${BAKE_OUTPUT}/searchindex" ]; then
    cp "${BAKE_OUTPUT}/searchindex" "${BAKE_OUTPUT}/searchindex.json"
    echo "Generated: ${BAKE_OUTPUT}/searchindex.json"
elif [ -f "${BAKE_OUTPUT}/searchindex/index" ]; then
    cp "${BAKE_OUTPUT}/searchindex/index" "${BAKE_OUTPUT}/searchindex.json"
    echo "Generated: ${BAKE_OUTPUT}/searchindex.json"
else
    echo "Error: searchindex not found in ${BAKE_OUTPUT}"
    echo "Available files:"
    ls -la "${BAKE_OUTPUT}" 2>/dev/null | head -20 || echo "Directory not found"
    exit 1
fi