# Wallpaper Dinâmico com mpvpaper + Hyprland

## 📋 Setup Completo

### ✅ O que foi configurado

1. **Script melhorado** (`wallpaper-random.sh`):
   - ✓ Logging detalhado em `~/.cache/hypr/wallpaper.log`
   - ✓ PID lock para evitar múltiplas instâncias
   - ✓ Tratamento de erros e validação
   - ✓ Graceful shutdown com SIGTERM/SIGINT
   - ✓ Seleção aleatória de vídeos a cada 5 min

2. **Config Lua corrigida** (`hyprland.lua`):
   - ✓ Script executado em background via `nohup`
   - ✓ Dentro do hook `hyprland.start` para sincronização correta
   - ✓ Logs redirecionados para `~/.cache/hypr/wallpaper.log`

3. **Systemd user service** (opcional):
   - ✓ Gerenciamento automático de restart
   - ✓ Integração com `graphical-session.target`
   - ✓ Logs em `journalctl`

---

## 🚀 Opções de Execução

### **Opção 1: Via Hyprland Lua (Padrão)**
```bash
# Já está configurado em hyprland.lua
# Basta fazer login normalmente no Hyprland
```

**Vantagens:**
- Simples e integrado
- Funciona com a config atual

**Verificar:**
```bash
tail -f ~/.cache/hypr/wallpaper.log
ps aux | grep wallpaper-random.sh
```

---

### **Opção 2: Via Systemd (Recomendado)**
```bash
# Habilitar o serviço
systemctl --user enable hyprland-wallpaper.service

# Iniciar agora
systemctl --user start hyprland-wallpaper.service

# Status
systemctl --user status hyprland-wallpaper.service

# Logs (tempo real)
journalctl --user -u hyprland-wallpaper.service -f
```

**Vantagens:**
- Restart automático em caso de erro
- Integração com sessão de desktop
- Logs centralizados via journalctl
- Mais robusto

**Desabilitar se quiser voltar para Opção 1:**
```bash
systemctl --user disable hyprland-wallpaper.service
systemctl --user stop hyprland-wallpaper.service
```

---

### **Opção 3: Manual (Debug)**
```bash
# Terminal 1
~/.config/hypr/scripts/wallpaper-random.sh

# Terminal 2 (logs)
tail -f ~/.cache/hypr/wallpaper.log
```

---

## 📁 Estrutura de Pastas

Certifique-se de que tem vídeos em:
```
~/Pictures/wallpapers/dynamic/
├── video1.mp4
├── video2.mkv
└── video3.webm
```

Se a pasta não existe:
```bash
mkdir -p ~/Pictures/wallpapers/dynamic/
# Copiar/baixar vídeos para lá
```

---

## 🔧 Customização

### Alterar intervalo de troca (padrão: 5 min = 300s)
Edit `wallpaper-random.sh`:
```bash
INTERVAL=300  # Mudar para 600 (10 min), 900 (15 min), etc
```

### Filtros de vídeo
Para incluir/excluir formatos, edit a linha:
```bash
-iname "*.mp4" -o -iname "*.mkv" -o -iname "*.webm"
# Adicionar: -o -iname "*.flv"  etc
```

### Caminho customizado de vídeos
```bash
DIR="/caminho/customizado/videos"
```

---

## 🐛 Troubleshooting

### Script não inicia
```bash
# Verificar permissões
ls -la ~/.config/hypr/scripts/wallpaper-random.sh
chmod +x ~/.config/hypr/scripts/wallpaper-random.sh

# Testar script manualmente
~/.config/hypr/scripts/wallpaper-random.sh
# (vai rodar em loop - Ctrl+C para parar)
```

### Sem vídeo no background
```bash
# Verificar log
tail ~/.cache/hypr/wallpaper.log

# Verificar se mpvpaper está instalado
which mpvpaper
```

### Se estiver usando hyprpaper
```bash
# hyprpaper e mpvpaper não devem rodar ao mesmo tempo
pkill hyprpaper
```

### Múltiplas instâncias rodando
```bash
# Matar todas
pkill -f wallpaper-random.sh
pkill mpvpaper

# Ver PID lock
cat ~/.cache/hypr/wallpaper.pid
```

---

## 📊 Monitoramento

```bash
# Ver logs em tempo real
tail -f ~/.cache/hypr/wallpaper.log

# Ver processos
ps aux | grep -E 'wallpaper-random|mpvpaper'

# Ver se systemd está rodando (se ativado)
systemctl --user status hyprland-wallpaper.service
journalctl --user -u hyprland-wallpaper.service -f
```

---

## 🎨 Dicas Extras

### Para melhor performance:
- Use vídeos em 1080p ou 1440p (não 4K)
- Codec H.264 ou VP9 são bons
- Tamanho ~50-100MB por vídeo é ideal

### Tema escuro/claro automático:
Pode integrar com wallpaper automático e trocar tema:
```bash
# Adicionar ao script quando trocar wallpaper:
# hyprctl setkeymap us
```

---
