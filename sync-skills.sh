#!/bin/bash
# sync-skills.sh — Sincroniza skills del vault central al proyecto actual
# Uso: ./sync-skills.sh [skill-name]
# Sin argumentos: sincroniza todas
# Con argumento: sincroniza solo esa skill

VAULT_REPO="https://github.com/USUARIO/skills-vault.git"  # ← Cambiar por tu repo
SKILLS_DIR=".claude/skills"
TMP_DIR="/tmp/skills-vault-$$"

echo "🔄 Sincronizando skills..."

# Clonar vault
git clone --depth 1 "$VAULT_REPO" "$TMP_DIR" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "❌ No se pudo clonar el vault. Verifica la URL del repo."
    exit 1
fi

mkdir -p "$SKILLS_DIR"

if [ -n "$1" ]; then
    # Sincronizar skill específica
    if [ -f "$TMP_DIR/$1/SKILL.md" ]; then
        mkdir -p "$SKILLS_DIR/$1"
        cp -r "$TMP_DIR/$1/"* "$SKILLS_DIR/$1/"
        echo "✅ $1"
    else
        echo "❌ Skill '$1' no encontrada en el vault"
    fi
else
    # Sincronizar todas
    for skill_dir in "$TMP_DIR"/*/; do
        skill_name=$(basename "$skill_dir")
        if [ -f "$skill_dir/SKILL.md" ]; then
            mkdir -p "$SKILLS_DIR/$skill_name"
            cp -r "$skill_dir"* "$SKILLS_DIR/$skill_name/"
            echo "✅ $skill_name"
        fi
    done
fi

# Limpiar
rm -rf "$TMP_DIR"
echo "━━━ Sync completo ━━━"
