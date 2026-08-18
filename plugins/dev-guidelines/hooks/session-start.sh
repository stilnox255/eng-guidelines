#!/usr/bin/env bash
# dev-guidelines — SessionStart hook: inject the two always-on engineering
# policies as hidden context, the same way they used to be @-imported from
# each project's own CLAUDE.md.
set -euo pipefail

cat "${CLAUDE_PLUGIN_ROOT}/docs/guidelines/release-it.md"
echo
echo "---"
echo
cat "${CLAUDE_PLUGIN_ROOT}/docs/guidelines/use-the-platform.md"
