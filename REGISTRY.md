# Skill Registry — All Global Holding

Última actualización: 2025-06-02

| # | Skill | v | Qué hace | Agentes | Trigger principal |
|---|---|---|---|---|---|
| 1 | `demo-screens` | 1.0 | Pantallas navegables sin integraciones | Code | "demo", "pantallas", "mockup" |
| 2 | `demo-pwa-builder` | 1.0 | Demo full con PWA, auth, SEO | Code | "demo completa", "PWA instalable" |
| 3 | `skill-factory` | 1.0 | Auto-crea skills cuando no existe una | Code | Tarea sin skill existente |
| 4 | `sync-protocol` | 1.0 | Coordinación Claude/Code/Dispatch | Todos | "sync", "pásale a Code" |
| 5 | `turbo-boot` | 1.0 | Arranque rápido + modo lean + BRAIN.md | Code | Inicio de sesión, "boot" |
| 6 | `secret-injector` | 1.0 | Auto-detecta, valida e inyecta keys | Chat, Code | Pegar credencial |
| 7 | `skill-loader` | 1.0 | Inyecta skills en cualquier chat/agente | Todos | "carga skill", "sync skills" |
| 8 | `luis-collaboration` | 1.0 | Tono, patrones técnicos, contexto Luis | Chat | Siempre activa |
| 9 | `content-engine` | 1.0 | Contenido multi-plataforma | Chat, Code | "post", "contenido", "campaña" |

## Dependencias entre skills

```
turbo-boot ← arranca primero, indexa todas las demás
    │
    ├── sync-protocol ← coordinación entre agentes
    │       │
    │       └── skill-loader ← distribuye skills entre agentes
    │
    ├── skill-factory ← genera skills nuevas automáticamente
    │       │
    │       └── skill-loader ← publica skills nuevas al vault
    │
    ├── secret-injector ← gestiona credenciales
    │
    ├── demo-screens ← demos rápidas
    │
    └── demo-pwa-builder ← demos completas
```

## Prioridad de ejecución

1. `turbo-boot` — SIEMPRE primero (bootloader)
2. `luis-collaboration` — SIEMPRE activa (tono y contexto)
3. `skill-loader` — Si se necesita cargar skill faltante
4. Las demás — Según la tarea

## Changelog

| Fecha | Cambio |
|---|---|
| 2025-06-02 | Vault creado con 9 skills iniciales |
