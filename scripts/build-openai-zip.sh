#!/bin/sh
# Builds the ChatGPT/Codex upload package from the repo root. Only the
# Agent Plugins files go in: .claude-plugin/ and .mcp.json stay out, because
# OpenAI's portal converts a Claude manifest it finds in the ZIP.
set -eu
cd "$(dirname "$0")/.."
version=$(node -p 'require("./plugin.json").version')
out="${1:-dist}/wishapp-plugin-${version}.zip"
mkdir -p "$(dirname "$out")"
rm -f "$out"
zip -r -X "$out" plugin.json mcp.json skills assets -x '*/.*' -x '.*'
echo "$out"
