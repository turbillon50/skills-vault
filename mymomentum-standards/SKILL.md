---
name: mymomentum-standards
version: 1.0
description: Stack minimo obligatorio para TODAS las apps MYMOMENTUM. Sin esto no esta terminada.
---
# MYMOMENTUM Standards

## Obligatorio en toda app

### Clerk
- Production con dominio real (pk_live_)
- Webhook user.created/updated/deleted a DB
- CLERK_WEBHOOK_SIGNING_SECRET en Vercel

### Neon
- DATABASE_URL con pooler
- DIRECT_URL sin pooler
- Tabla users sincronizada con Clerk

### Resend
- RESEND_API_KEY
- From: App <hola@dominio.com>
- Email bienvenida en user.created

### VAPID (push notifications)
- NEXT_PUBLIC_VAPID_PUBLIC_KEY
- VAPID_PRIVATE_KEY
- VAPID_SUBJECT
- sw.js con push listener

### Panel Admin (referencia: CSN Carnes)
- /admin protegida por rol Clerk
- Dashboard con metricas reales
- CRUD de entidades principales
- Dark mode

### PWA
- manifest.json con iconos 192+512 reales
- sw.js con cache basico
- Instalable en pantalla inicio

### Landing
- Hero que vende — NO redirigir a /registro
- /demo publica
- Mobile-first

### Flujo
/ -> /registro -> /onboarding -> /dashboard
- Estados vacios con CTA
- Cero mock data

### Build
- npm run build sin errores
- task-supervisor antes de declarar listo
