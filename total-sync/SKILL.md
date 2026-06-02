---
name: total-sync
description: Sincronizacion total al inicio de cada chat, Claude Code o Dispatch. Carga TODO el contexto del ecosistema para que cada agente tenga la misma informacion. ACTIVAR SIEMPRE al inicio de cualquier conversacion, cuando el usuario diga "sync", "sincroniza", "carga todo", "arranca", "contexto", o cuando detectes que el agente no tiene contexto de los proyectos.
---
# Total Sync — Un ecosistema, una mente

## Proposito
No importa si es un chat nuevo, Claude Code fresco o Dispatch desde el celular. TODOS arrancan con el mismo contexto completo. Sin repetir informacion, sin perder estado.

## Al abrir cualquier chat/sesion, ejecutar:

### Paso 1: Consultar Brain (5 queries)

```
POST http://178.105.135.26/brain/query
Headers: Content-Type: application/json
Body: {"secret":"superclaude2025","query":"..."}
```

Query 1 — Proyectos activos:
SELECT id, name, domain, phase, last_action, next_step FROM projects WHERE active = true ORDER BY updated_at DESC

Query 2 — Skills disponibles:
SELECT name, version, description FROM skills ORDER BY name

Query 3 — Patterns criticos:
SELECT title, fix, tags FROM patterns WHERE 'CRITICO' = ANY(tags) OR 'RESUELTO' = ANY(tags) ORDER BY created_at DESC LIMIT 10

Query 4 — Tareas pendientes:
SELECT id, command, project_id, status FROM dispatch_queue WHERE status = 'pending' ORDER BY id

Query 5 — Ultimas conversaciones:
SELECT project_id, agent, summary, decisions FROM conversations ORDER BY created_at DESC LIMIT 5

### Paso 2: Cargar credenciales disponibles
SELECT project_id, service, env_var_name, status FROM credentials_registry WHERE status = 'active' ORDER BY project_id

### Paso 3: Verificar infraestructura
GET http://178.105.135.26/brain/ping
Esperado: {"status":"alive","skills":N}

## Contexto estatico (siempre igual)

### Conexiones
- Brain: postgresql://...@ep-super-glitter-aqj6d5g0-pooler...neondb
- Relay: POST http://178.105.135.26/brain/exec (secret: superclaude2025)
- Vault: github.com/turbillon50/skills-vault
- Skills en Hetzner: /home/skills-vault/

### Luis Delator
- Email: turbillon50@gmail.com / luisdelator@vmomentums.info
- Empresa: All Global Holding LLC
- Rol: Disenador, one-person shop
- Estilo: Mexicano casual, ejecucion-primero, cero explicaciones innecesarias
- Pattern: El siempre tiene la razon en lo visual

### Agentes
- Claude Chat: Coordinador, planea, orquesta, ejecuta via relay/Playwright
- Claude Code: Ejecutor de codigo, scaffoldea, debuggea, pushea
- Dispatch: Comandos rapidos desde movil

### Reglas criticas
1. DNS name.com: host es SOLO subdominio, NUNCA dominio completo
2. Clerk production: button aria-haspopup en x=602,y=28 (viewport 1280x800)
3. DKIM Resend: obtener valor COMPLETO, nunca truncar
4. Playwright: SIEMPRE screenshot antes de clickear
5. Scripts al relay: SIEMPRE en base64 para evitar escaping
6. Neon HTTP SQL: una sentencia por query

## Formato de reporte post-sync
Despues de cargar todo, reportar en formato compacto:

```
SYNC COMPLETO
Proyectos: N activos (lista)
Skills: N cargadas
Patterns: N criticos
Tareas: N pendientes
Relay: alive/down
Ultimo: [ultimo proyecto tocado] — [ultima accion]
```

## Para Claude Code especificamente
Agregar al inicio de cada prompt:
"Antes de empezar, consulta http://178.105.135.26/brain/query con SELECT * FROM projects WHERE id = '{PROJECT_ID}' para obtener contexto actualizado. Las credenciales estan en Vercel env vars. Las skills estan en /home/skills-vault/ del servidor."

## Para Dispatch
Simplificar a: proyecto activo + ultima accion + tareas pendientes.

## Heartbeat post-sync
Despues de sincronizar, escribir heartbeat:
INSERT INTO heartbeats (project_id, agent, step, detail) VALUES ('system', '{AGENT}', 'total-sync', 'Loaded N projects, N skills, N patterns')
