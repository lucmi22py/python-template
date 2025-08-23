#!/usr/bin/env bash
set -euo pipefail

err_report() {
  local exit_code=$?
  # BASH_SOURCE[1] と BASH_LINENO[0] でエラー発生箇所を取得する
  echo "Error: exit code ${exit_code} at ${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
}
trap 'err_report' ERR

npm install -g @openai/codex
uv python install $(cat .python-version)
uv venv ~/.local/.venv --python $(cat .python-version)
uv sync --locked
