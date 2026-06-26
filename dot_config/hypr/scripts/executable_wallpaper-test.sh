#!/bin/bash

# Script de teste e instalação para wallpaper dinâmico

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_FILE="${SCRIPT_DIR}/wallpaper-random.sh"

echo "═════════════════════════════════════════════════════════"
echo "  Wallpaper Dinâmico - Teste e Verificação"
echo "═════════════════════════════════════════════════════════"
echo ""

# 1. Verificar permissões
echo "[1/6] Verificando permissões do script..."
if [[ ! -x "$SCRIPT_FILE" ]]; then
    echo "    ⚠️  Script não é executável. Corrigindo..."
    chmod +x "$SCRIPT_FILE"
    echo "    ✓ Permissões corrigidas"
else
    echo "    ✓ Script é executável"
fi

# 2. Verificar dependências
echo ""
echo "[2/6] Verificando dependências..."
MISSING=false

for cmd in mpvpaper find shuf; do
    if command -v "$cmd" &> /dev/null; then
        echo "    ✓ $cmd encontrado"
    else
        echo "    ✗ $cmd NÃO ENCONTRADO"
        MISSING=true
    fi
done

if command -v hyprpaper &> /dev/null && pgrep -x hyprpaper &> /dev/null; then
    echo "    ⚠️  hyprpaper está em execução e pode bloquear mpvpaper"
    echo "       Pare hyprpaper antes de testar/usar este script"
    echo "       Comando sugerido: pkill -x hyprpaper"
fi

if [[ "$MISSING" == true ]]; then
    echo ""
    echo "    Instalando dependências (mpvpaper)..."
    if command -v pacman &> /dev/null; then
        echo "    sudo pacman -S mpvpaper"
    elif command -v apt &> /dev/null; then
        echo "    sudo apt install mpvpaper"
    else
        echo "    Instale manualmente: mpvpaper"
    fi
fi

# 3. Verificar pasta de vídeos
echo ""
echo "[3/6] Verificando pasta de vídeos..."
VIDEO_DIR="$HOME/Pictures/wallpapers/dynamic"

if [[ ! -d "$VIDEO_DIR" ]]; then
    echo "    ⚠️  Pasta não existe: $VIDEO_DIR"
    echo "    Criando..."
    mkdir -p "$VIDEO_DIR"
    echo "    ✓ Pasta criada"
    echo ""
    echo "    📌 Adicione vídeos em: $VIDEO_DIR"
else
    VIDEO_COUNT=$(find "$VIDEO_DIR" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.webm" \) 2>/dev/null | wc -l)
    if [[ $VIDEO_COUNT -eq 0 ]]; then
        echo "    ⚠️  Pasta existe mas SEM vídeos!"
        echo "    Adicione vídeos em: $VIDEO_DIR"
    else
        echo "    ✓ Pasta existe com $VIDEO_COUNT vídeo(s)"
    fi
fi

# 4. Verificar diretório de cache/logs
echo ""
echo "[4/6] Verificando diretório de logs..."
LOG_DIR="$HOME/.cache/hypr"
mkdir -p "$LOG_DIR"
echo "    ✓ Diretório pronto: $LOG_DIR"

# 5. Teste de execução
echo ""
echo "[5/6] Teste de execução rápida..."
echo "    Iniciando script por 10 segundos..."

if timeout 10 "$SCRIPT_FILE" 2>&1 | head -20; then
    echo "    ✓ Script executou sem erros"
else
    EXIT_CODE=$?
    if [[ $EXIT_CODE -eq 124 ]]; then
        echo "    ✓ Script executou (timeout esperado)"
    else
        echo "    ⚠️  Possível erro (código: $EXIT_CODE)"
    fi
fi

# 6. Informações de status
echo ""
echo "[6/6] Status do sistema..."

if command -v systemctl &> /dev/null; then
    SERVICE_FILE="$HOME/.config/systemd/user/hyprland-wallpaper.service"
    if [[ -f "$SERVICE_FILE" ]]; then
        if systemctl --user is-enabled hyprland-wallpaper.service &>/dev/null; then
            echo "    ✓ Systemd service ATIVADO"
        else
            echo "    ℹ️  Systemd service instalado mas não ativado"
            echo "       Para ativar: systemctl --user enable hyprland-wallpaper.service"
        fi
    else
        echo "    ℹ️  Systemd service não encontrado"
    fi
fi

echo ""
echo "═════════════════════════════════════════════════════════"
echo "  ✓ Verificação completa!"
echo "═════════════════════════════════════════════════════════"
echo ""
echo "📚 Próximos passos:"
echo ""
echo "  1. Adicione vídeos em: $VIDEO_DIR"
echo ""
echo "  2. Escolha uma opção de execução:"
echo ""
echo "     a) Via Hyprland Lua (padrão)"
echo "        → Já está configurado, basta fazer login"
echo ""
echo "     b) Via Systemd (recomendado)"
echo "        systemctl --user enable hyprland-wallpaper.service"
echo "        systemctl --user start hyprland-wallpaper.service"
echo ""
echo "  3. Verificar logs:"
echo "        tail -f ~/.cache/hypr/wallpaper.log"
echo ""
echo "  4. Leia o guia completo:"
echo "        ~/.config/hypr/WALLPAPER_SETUP.md"
echo ""
