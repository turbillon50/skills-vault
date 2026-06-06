---
name: vforge-method
description: VFORGE METHOD V1 — From Prompt to Production. El proceso oficial completo para llevar cualquier app de idea a produccion, en 9 fases con gates medibles, roles del motor, y la regla de las 3 evidencias. VForge = la plataforma/fabrica; VForge Method = el proceso. ACTIVAR al iniciar o cerrar cualquier app, al planear el flujo, o cuando Luis diga el metodo, las fases, de prompt a produccion, en que fase voy.
---
# VFORGE METHOD V1 — From Prompt to Production

> VForge = la plataforma (la fabrica). VForge Method = el proceso.

## Roles del motor (la fabrica de software)
- **Claude Code (Hetzner)** = el MOTOR constructor (no es "el constructor", es el motor).
- **Dispatch** = el ORQUESTADOR (dirige, verifica en vivo, candadea).
- **VForge** = la FABRICA.
- **Auditores (agentes read-only)** = el SISTEMA NERVIOSO.
- **GitHub** = la MEMORIA. **Hetzner** = la PLANTA INDUSTRIAL. **Vercel** = la LINEA DE PRODUCCION.

## REGLA DE ORO (candado de cada fase/modulo)
Ningun modulo/fase se da por TERMINADO sin las 3 evidencias en PRODUCCION:
1. **Evidencia VISUAL** (screenshot movil 390px + desktop, se ve bien).
2. **Evidencia FUNCIONAL** (el flujo hace lo que debe: login entra, dato se guarda, pago pasa).
3. **Evidencia OPERATIVA** (vive en produccion: deploy READY, /api/health ok, dominio/SSL, correo entrega).
Cuando pasan las 3 -> la fase se CANDADEA: registro en brain con evidencia. Antes de CADA deploy se re-verifican las fases candadeadas; si un cambio rompe una, se DETIENE o se hace rollback. (Anti-regresion: ya no se rompe despues.)

## Las 9 fases (cada una con su gate PASA/NO PASA)
- **F0 Discovery** — entrada: idea/problema/cliente/branding/logo/referencias. Salida: Blueprint + README Maestro + arquitectura. GATE: existe blueprint + README maestro.
- **F1 Design Engine** (v0 / Stitch / Visurow) — demo navegable. GATE: frontend + UX + flujo validados (evidencia visual).
- **F2 Forge Engine** (Dispatch) — GitHub, README, branches, releases, Vercel. GATE: repo productivo conectado a Vercel. Skills: revision-merge-deploy.
- **F3 Infrastructure Engine** — Name.com, DNS, SSL, Vercel, Clerk, Neon, Resend, creados y VERIFICADOS. GATE: dominio+SSL ok, Clerk deployed (DNS verificado), Neon conectado, Resend verificado. Skills: provision-stack, provision-clerk, secret-injector, dns-manager.
- **F4 Build Engine** (Claude Code Hetzner) — APIs, roles, base de datos, logica, seguridad, integraciones. GATE: migracion corrida + datos reales (cero mock) + /api/health ok (evidencia funcional).
- **F5 Admin Engine** — toda app lleva: Dashboard, CRM, Analytics, Push, Resend Center, File Center, AI Center, Integration Center, Audit Center, Error Center, Backup Center. GATE: panel nivel CSN con CRUD real.
- **F6 Integration Engine** — Stripe, Mercado Pago, WhatsApp, Twilio, Maps, Facturapi, HubSpot, Airtable, SAT, Buro, ERP, Ticketing, Travel, y cualquier API. GATE: integracion conectada y PROBADA.
- **F7 QA Engine** (agentes auditores) — UI, UX, APIs, seguridad, performance, responsive, PWA. GATE: 0 criticos/altos (skills: qa-tester-team, manifiesto-app).
- **F8 Production Engine** — entrega: dominio + SSL + base de datos + correos + panel admin + app publica + PWA + documentacion + monitoreo. GATE: las 3 evidencias en produccion = COBRABLE.

## El manifiesto (gates de calidad transversales a las fases)
Ver skill manifiesto-app (11 puntos): acceso que entra, backend real + migracion, una sola navegacion, icono PWA = logo, PWA instalable, estabilidad, identidad (cero dorado), correo verificado, legal+soporte, admin nivel CSN, verificado en vivo + documentado.

## Metricas que se marcan por app (semaforo)
Por cada app, % de fases candadeadas (0/9 → 9/9). Una app "cobrable" = F8 candadeada con las 3 evidencias. El cockpit muestra el avance por fases.

Skills que orquesta este metodo: ligar-habilidades, metodo-cierre-app, revision-merge-deploy, rollback, ver-logs, salud-app, provision-stack, provision-clerk, design-system, paleta-luis, icono-pwa, qa-tester-team, ajustar-readme, manifiesto-app, inventario-vercel.
