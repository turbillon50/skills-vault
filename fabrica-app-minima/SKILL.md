---
name: fabrica-app-minima
description: PIPELINE MAESTRO de un solo pase: de idea/mockup a APP FUNCIONAL MINIMA en produccion (no demo): identidad Higgsfield → prompt ganador → frontend → repo → Vercel → dominio → Neon → Clerk → Resend → secretos → deploy verificado. ACTIVAR cuando Luis diga "app en un pase", "fabrica la app", "app minima funcional", "de la idea a produccion", o al estrenar un cliente nuevo post-demo.
---
# FABRICA DE APP MINIMA — un solo pase (todo probado en produccion)

Cadena completa; cada eslabon tiene receta validada en el ecosistema:

1. IDENTIDAD (Higgsfield/MCP de imagenes): hero cinematografico + mockup + base de icono. Guardar URLs.
2. PROMPT: llenar [prompt-frontend-etapa1] con negocio, roles, paleta del logo, imagenes adjuntas.
3. FRONTEND: ejecutor Claude Code en Hetzner con el prompt (o v0 API si hay key) → Next.js App Router + Tailwind + shadcn, mock data primero.
4. REPO: crear en GitHub (turbillon50) via Contents API/git del server; commits autor turbillon50 <turbillon50@gmail.com>.
5. VERCEL: crear proyecto via API (token en /root/.env), conectar repo, build.
6. DOMINIO: Name.com API v4 (basic auth user=email) — comprar/configurar + DNS a Vercel. (Si aun no se decide compra: subdominio temporal del proyecto vercel.app y migrar despues.)
7. NEON: crear DB/branch via API o relay HTTP SQL del brain; migracion idempotente /api/setup.
8. CLERK: PROBADO — Playwright headless en Hetzner con /home/clerk-session.json crea la app production, extrae pk/sk, configura dominios (scripts de referencia: /root/clerk_arco.py y flujo usado para iStore app_3Ekrtc). Patron anti-loop SIEMPRE ([bug-clerk-handshake-recurrente]).
9. RESEND: alta dominio + DNS via API + verify + correo de prueba real (TTL 'Auto' → 3600).
10. SECRETOS PROPIOS: inyectar de la boveda segun necesidad — Mercado Pago V-FORGE (access token/webhook), Stripe, Mapbox (keys de mapas), VAPID, Gemini/OpenRouter — via Vercel env API ([secret-injector]).
11. DEPLOY + GATE: deploy READY + /api/health ok + manifiesto-app (B16 navegacion abierta, gate visual movil 390 + desktop) + 3 evidencias.
12. CIERRE: registrar en brain (client_project_status + brain_files cierre-<app>), liga-llave admin instalable, alta en cron de salud diaria.

RESULTADO: no es demo — es app funcional minima con login real, datos reales, correos reales y cobro listo. Tiempo objetivo del pase: < 2 horas.
Relacionado: [provision-stack-runbook], [prompt-frontend-etapa1], [secret-injector], [manifiesto-app], [entrega-cliente].