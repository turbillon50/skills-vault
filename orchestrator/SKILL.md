---
name: orchestrator
description: Skill maestra de orquestacion. Unifica TODOS los agentes, servicios y capacidades en un solo flujo. ACTIVAR cuando el usuario diga "crea una app", "nuevo proyecto", "levanta X", "configura todo", "setup completo", "orquesta", o cuando se necesite coordinar multiples servicios para un objetivo. Esta skill LLAMA a las demas skills segun se necesiten. Es el director de orquesta.
---
# Orchestrator — El director de orquesta

## Capacidades disponibles

### Agentes
| Agente | Canal | Puede hacer |
|---|---|---|
| Claude Chat | Este chat | Planear, orquestar, ejecutar via relay, Playwright |
| Claude Code | dispatch_queue o directo | Escribir codigo, scaffoldear apps, debugging |
| Dispatch | dispatch_queue | Comandos rapidos desde movil |

### Servicios (todos con API keys activas)
| Servicio | Accion | Via |
|---|---|---|
| GitHub | Crear repos, push, clone | Hetzner git credentials |
| Vercel | Crear proyectos, deploy, env vars, dominios | API token |
| Neon | Crear bases de datos, ejecutar SQL | API key |
| Clerk | Crear apps, production, keys, DNS | Playwright + Gmail |
| Stripe | Productos, precios, payment links, webhooks | API sk_live |
| Resend | Configurar dominios, enviar emails | API key |
| name.com | DNS records (24 dominios) | API token |
| Twilio | Verificacion SMS | SID + Token |
| Gmail | Leer codigos verificacion | IMAP + app password |
| Reloadly | Gift cards, recargas | Client ID + Secret |
| Viator | Tours y experiencias | API key |
| Gemini + Grok | IA generativa | API keys |
| v0 | Generar codigo | API key |
| Playwright | Automatizar navegador | Hetzner chromium |

### Infraestructura
| Pieza | URL/Detalle |
|---|---|
| Neon Brain | postgresql en Hetzner relay |
| Hetzner relay | POST http://178.105.135.26/brain/exec |
| dispatch_queue | Tabla en Neon Brain para tareas entre agentes |
| Skills vault | github.com/turbillon50/skills-vault |

---

## Flujos pre-armados

### FLUJO 1: Crear proyecto nuevo completo
Trigger: "crea una app de X con dominio Y"

1. **GitHub**: Crear repo
   - POST brain/exec -> git init, commit, push
2. **Vercel**: Crear proyecto + conectar repo
   - POST Vercel API /v9/projects
3. **Neon**: Crear base de datos
   - POST Neon API /v2/projects
4. **Clerk**: Crear app + production
   - Skill: clerk-automation (Playwright + Gmail)
   - Obtener pk_live_ y sk_live_
5. **Resend**: Agregar dominio
   - POST /domains con el dominio
6. **name.com**: Configurar DNS
   - A record -> 76.76.21.21 (Vercel)
   - CNAME www -> cname.vercel-dns.com
   - 5 CNAMEs de Clerk
   - 3 records de Resend (DKIM + MX + SPF)
7. **Stripe**: Crear producto + precio + webhook
   - Skill: integrate-stripe
8. **Vercel**: Inyectar TODAS las env vars
   - CLERK keys, DATABASE_URL, RESEND_API_KEY, STRIPE keys, APP_URL
9. **dispatch_queue**: Mandar tarea a Claude Code
   - Scaffoldear Next.js con auth, DB, pagos
10. **Brain**: Registrar proyecto + credenciales + log

### FLUJO 2: Configurar proyecto existente
Trigger: "configura X" o "conecta todo a X"

1. Leer Brain: que tiene y que falta
2. Crear solo lo que falta (Clerk, Neon, etc.)
3. Inyectar env vars faltantes
4. Verificar DNS

### FLUJO 3: Deploy rapido
Trigger: "despliega X" o "publica X"

1. Hetzner: git pull + verificar
2. Vercel: trigger redeploy
3. Verificar URL responde 200

### FLUJO 4: Status de todo
Trigger: "como van mis proyectos" o "status"

1. Brain: SELECT proyectos activos
2. Vercel: check deployment status
3. Reportar tabla con status

---

## Orden de operaciones
Siempre seguir este orden para evitar dependencias rotas:
1. GitHub (repo debe existir antes de Vercel)
2. Neon (DB debe existir antes de schema)
3. Clerk (auth debe existir antes de inyectar keys)
4. Resend (domain debe registrarse antes de DNS)
5. name.com (DNS despues de tener todos los values)
6. Stripe (pagos es independiente pero va despues de Vercel)
7. Vercel env vars (al final cuando todo esta listo)
8. Vercel deploy (ultimo paso)

## Reglas
- NO pedir confirmacion entre pasos. Ejecutar todo y reportar al final.
- Si un paso falla, continuar con los demas y reportar que fallo.
- Usar vision (screenshots) cuando Playwright no coopere.
- Todo queda logueado en Brain automaticamente.
- Usar relay para operaciones de red cuando sea necesario.

## Skills que llama
- clerk-automation (crear apps Clerk)
- integrate-stripe (configurar pagos)
- secret-injector (inyectar credenciales)
- auto-verify (verificacion SMS/email)
- infra-monitor (status de GitHub/Vercel)
- neon-brain (memoria persistente)
- sync-protocol (coordinacion entre agentes)


## REGLA CRITICA DNS (name.com)
Al crear DNS records en name.com, el host es SOLO el subdominio:
- CORRECTO: clerk, accounts, send, resend._domainkey
- INCORRECTO: clerk.dominio.com, accounts.dominio.com
Verificar SIEMPRE con `dig` despues de crear records.
