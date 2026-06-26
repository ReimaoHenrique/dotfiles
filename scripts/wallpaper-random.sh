#!/bin/bash

set -euo pipefail

# -----------------------------
# CONFIGURAÇÃO
# -----------------------------

VIDEO_DIR="$HOME/Pictures/wallpapers/dynamic"
LOG_FILE="$HOME/.cache/hypr/wallpaper.log"

detect_output() {
    mpvpaper --help-output 2>/dev/null | awk '/^\[\*\]/ {print $3; exit}'
}

MONITOR="${1:-$(detect_output)}"   # opcional: eDP-1, DP-1 etc
if [[ -z "$MONITOR" ]]; then
    MONITOR="eDP-1"
fi

DELAY=300           

mkdir -p "$(dirname "$LOG_FILE")"

# PATH seguro para Hyprland
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin"

# -----------------------------
# LOG
# -----------------------------
exec >>"$LOG_FILE" 2>&1

echo "======================================"
echo "[wallpaper] iniciado em $(date)"
echo "======================================"

# -----------------------------
# VERIFICAÇÕES
# -----------------------------

if ! command -v mpvpaper &>/dev/null; then
    echo "[ERRO] mpvpaper não encontrado"
    exit 1
fi

if [[ ! -d "$VIDEO_DIR" ]]; then
    echo "[ERRO] diretório não existe: $VIDEO_DIR"
    exit 1
fi

# -----------------------------
# LISTA DE VÍDEOS
# -----------------------------

mapfile -t VIDEOS < <(
    find "$VIDEO_DIR" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.webm" \)
)

if [[ ${#VIDEOS[@]} -eq 0 ]]; then
    echo "[ERRO] nenhum vídeo encontrado em $VIDEO_DIR"
    exit 1
fi

echo "[OK] ${#VIDEOS[@]} vídeos encontrados"

# -----------------------------
# FUNÇÃO: escolhe vídeo aleatório
# -----------------------------
pick_video() {
    echo "${VIDEOS[RANDOM % ${#VIDEOS[@]}]}"
}

# -----------------------------
# LOOP PRINCIPAL
# -----------------------------

CURRENT_PID=""

cleanup() {
    echo "[INFO] encerrando..."
    [[ -n "${CURRENT_PID}" ]] && kill "$CURRENT_PID" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

while true; do
    VIDEO="$(pick_video)"

    echo "[INFO] novo wallpaper: $VIDEO"

    # mata anterior
    if [[ -n "$CURRENT_PID" ]]; then
        kill "$CURRENT_PID" 2>/dev/null || true
        sleep 1
    fi

    # inicia mpvpaper
    if pgrep -x hyprpaper >/dev/null 2>&1; then
        echo "[INFO] hyprpaper detectado, encerrando para liberar mpvpaper"
        pkill -x hyprpaper || true
        sleep 1
    fi

    mpvpaper -o "loop --no-audio" "$MONITOR" "$VIDEO" &
    CURRENT_PID=$!

    sleep "$DELAY"
done