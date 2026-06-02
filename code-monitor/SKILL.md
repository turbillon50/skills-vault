---
name: code-monitor
description: Monitorear en tiempo real que esta haciendo Claude Code en cualquier proyecto. Ver commits, archivos modificados, deployments, errores. ACTIVAR cuando el usuario diga "que esta haciendo Code", "como va", "status", "que ha hecho", "progreso", "monitorea", o cuando se necesite visibilidad de lo que Claude Code esta ejecutando.
---
# Code Monitor — Ojo en Claude Code

## 3 canales de monitoreo

### 1. Git log (commits recientes)
Desde Hetzner:
POST /brain/exec: cd /tmp/{repo} && git pull && git log --oneline -10

Nos dice: que commits hizo, cuando, que archivos toco.

### 2. Vercel deployments
GET https://api.vercel.com/v6/deployments?projectId={PID}&teamId={TEAM}&limit=3
Header: Authorization: Bearer {VERCEL_TOKEN}

Nos dice: si desplegó, si fallo el build, URL del deploy.

### 3. Vercel build logs (si fallo)
GET https://api.vercel.com/v6/deployments/{DEPLOY_ID}/events?teamId={TEAM}

Nos dice: que error exacto tronó el build.

## Como usarlo

### Check rapido
"Como va CSN?" ->
1. git pull en Hetzner, ver ultimos commits
2. Check Vercel deployment status
3. Reportar en tabla

### Debug si fallo
"Que paso con el deploy?" ->
1. GET deployments, encontrar el fallido
2. GET build logs del fallido
3. Identificar error
4. Generar fix o mandarlo a dispatch_queue

### Estructura de archivos
"Que lleva?" ->
1. git pull
2. find src/ -type f | head -30
3. Reportar estructura

## Formato de reporte
| Check | Status |
|---|---|
| Ultimo commit | {hash} {msg} hace {time} |
| Archivos | {N} archivos en src/ |
| Deploy | {status} - {url} |
| Build | {ok/error: msg} |
