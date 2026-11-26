#!/bin/sh
# Builds the ChatGPT/Codex upload package: the Agent Plugins manifest from
# openai/ plus the skill and logo shared with the Claude plugin in plugin/.
# The Claude files stay out, because OpenAI's portal converts a Claude
# manifest it finds in the ZIP.
set -eu
cd "$(dirname "$0")/.."
version=$(node -p 'require("./openai/plugin.json").version')
outdir="${1:-dist}"
mkdir -p "$outdir"
out="$(cd "$outdir" && pwd)/wishapp-plugin-${version}.zip"
stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT
mkdir -p "$stage/assets"
cp openai/plugin.json openai/mcp.json "$stage/"
cp openai/assets/composer-icon.svg plugin/assets/logo.png "$stage/assets/"
cp -R plugin/skills "$stage/skills"
rm -f "$out"
(cd "$stage" && zip -r -X "$out" plugin.json mcp.json skills assets -x '*/.*' -x '.*')
echo "$out"
