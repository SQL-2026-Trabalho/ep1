#!/usr/bin/env bash
set -euo pipefail

FILE_ID="1XJApOJjRe5BNFr3yzImz_O8iSnMZ2nCG"
ZIP_NAME="postgresql_script_criacao_bd.zip"
DESTINO="arquivos_postgres"
VENV_DIR=".venv_gdown"

# cria venv
python3 -m venv "$VENV_DIR"

# ativa venv
# shellcheck disable=SC1091
source "$VENV_DIR/bin/activate"

# instala gdown no venv
pip install --upgrade pip
pip install gdown

# baixa o zip
python -m gdown --id "$FILE_ID" -O "$ZIP_NAME"

# descompacta
mkdir -p "$DESTINO"
unzip -o "$ZIP_NAME" -d "$DESTINO"

echo "OK: arquivo baixado e extraído em $DESTINO/"
echo "Venv criado em: $VENV_DIR"
