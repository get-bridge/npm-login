#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

INPUT_REGISTRY=${INPUT_REGISTRY:-$NPM_LOGIN_REGISTRY}
npm config set "${INPUT_REGISTRY}:always-auth" "true"

INPUT_SCOPE=${INPUT_SCOPE:-$NPM_LOGIN_SCOPE}
npm config set "@${INPUT_SCOPE}:registry" "${INPUT_PROTOCOL}:${INPUT_REGISTRY}"

INPUT_EMAIL=${INPUT_EMAIL:-$NPM_LOGIN_EMAIL}
npm config set "${INPUT_REGISTRY}:email" "${INPUT_EMAIL}"

INPUT_USERNAME=${INPUT_USERNAME:-$NPM_LOGIN_USERNAME}
npm config set "${INPUT_REGISTRY}:username" "${INPUT_USERNAME}"

INPUT_PASSWORD=${INPUT_PASSWORD:-$NPM_LOGIN_PASSWORD}
npm config set "${INPUT_REGISTRY}:_password" "${INPUT_PASSWORD}"
