#!/usr/bin/env bash
set -e

ROOT_DIR="$( git rev-parse --show-toplevel )"

cd "${ROOT_DIR}"

docker build --tag codemetrics/docs --file docs/Dockerfile .
docker run --rm -it -p 8000:8000 codemetrics/docs
