# Skills Vault — All Global Holding

Repositorio central de habilidades para el ecosistema de IA de Luis Delator.

Cada skill es un archivo `SKILL.md` que enseña a Claude (chat, Code o Dispatch) a ejecutar tareas específicas sin improvisar.

## Uso

### En Claude Code (proyecto específico)
```bash
# Sincronizar todas las skills al proyecto actual
git clone --depth 1 https://github.com/{user}/skills-vault.git /tmp/sv
mkdir -p .claude/skills
cp -r /tmp/sv/*/ .claude/skills/ 2>/dev/null
rm -rf /tmp/sv
```

### En Claude chat
Pegar el contenido de cualquier SKILL.md o decir "carga la skill de X"

### En Dispatch
```
/load {skill-name}
```

## Skills disponibles

Ver [REGISTRY.md](REGISTRY.md) para el índice completo.

## Estructura
```
{skill-name}/
└── SKILL.md          ← Instrucciones (requerido)
    references/       ← Docs extra (opcional)
```

## Agregar nueva skill
1. Crear carpeta con nombre descriptivo (inglés, kebab-case)
2. Agregar `SKILL.md` con frontmatter `name` + `description`
3. Actualizar `REGISTRY.md`
4. Push

---
*All Global Holding LLC — 2025*
