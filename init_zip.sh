#!/usr/bin/env bash
set -euo pipefail

FILE_ID="1XJApOJjRe5BNFr3yzImz_O8iSnMZ2nCG"
FILE_2_ID="1B-2NtbyzpmnhKWx9xGo6KnbYIZteDjMD"
ZIP_NAME="postgresql_script_criacao_bd.zip"
ZIP_2_NAME="mysql_script_criacao_bd.zip"
DESTINO="arquivos_postgres"
DESTINO_2="arquivos_mysql"
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
python -m gdown --id "$FILE_2_ID" -O "$ZIP_2_NAME"

# descompacta
mkdir -p "$DESTINO"
unzip -o "$ZIP_NAME" -d "$DESTINO"

echo "OK: arquivo baixado e extraído em $DESTINO/"
echo "Venv criado em: $VENV_DIR"

mkdir -p "$DESTINO_2"
unzip -o "$ZIP_2_NAME" -d "$DESTINO_2"

echo "OK: arquivo baixado e extraído em $DESTINO_2/"
echo "Venv criado em: $VENV_DIR"
