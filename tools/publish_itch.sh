#!/usr/bin/env bash
set -euo pipefail

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
env_file="${project_root}/.env"
apk_file="${project_root}/builds/android/BathroomMayhem-test.apk"
butler_bin="${project_root}/.tools/butler/butler"
obsolete_sha="82be6782c5d16838d8aa198459d74fd54e5f6fb347f7cf60a27552be2eec2dbe"

if [[ ! -f "${env_file}" ]]; then
  echo "Crie .env a partir de .env.example e preencha os identificadores do itch.io." >&2
  exit 1
fi

# shellcheck disable=SC1090
source "${env_file}"

: "${ITCH_USER:?Defina ITCH_USER em .env}"
: "${ITCH_GAME:?Defina ITCH_GAME em .env}"
: "${ITCH_CHANNEL:=android-test}"

if [[ "${ITCH_USER}" == "seu-subdominio-no-itch" ]]; then
  echo "Substitua o valor de exemplo de ITCH_USER em .env." >&2
  exit 1
fi

if [[ ! -x "${butler_bin}" ]]; then
  echo "Butler não encontrado em ${butler_bin}. Consulte GIT_AND_ITCH_SETUP.md." >&2
  exit 1
fi

if [[ ! -f "${apk_file}" ]]; then
  echo "APK não encontrado em ${apk_file}. Gere e valide a build primeiro." >&2
  exit 1
fi

current_sha="$(sha256sum "${apk_file}" | awk '{print $1}')"
if [[ "${current_sha}" == "${obsolete_sha}" ]]; then
  echo "Publicação bloqueada: este é o APK top-down/joystick marcado como obsoleto." >&2
  exit 1
fi

"${butler_bin}" push "${apk_file}" "${ITCH_USER}/${ITCH_GAME}:${ITCH_CHANNEL}" --userversion "0.1.0-test"

