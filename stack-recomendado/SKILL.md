---
name: stack-recomendado
description: Stack tecnologico validado y recomendado para proyectos MYMOMENTUM. Incluye que usar, por que, y como implementarlo. ACTIVAR al iniciar un proyecto nuevo o al tomar decisiones de arquitectura.
---
# Stack Recomendado — MYMOMENTUM

## Stack base (TODO proyecto)
| Capa | Tecnologia | Por que |
|---|---|---|
| Framework | Next.js 14 App Router | SSR, API routes, deploy Vercel nativo |
| Lenguaje | TypeScript | Bugs detectados en build, no en prod |
| Estilos | Tailwind CSS | Utility-first, dark mode trivial, sin CSS separado |
| Animaciones | Framer Motion | GPU-accelerated, mobile-first, ya tenemos skill |
| UI Components | Design System propio | Consistencia, sin dependencia de shadcn/ui generico |
| Auth | Clerk | Webhooks, roles, social login, sin escribir auth |
| Database | Neon (PostgreSQL serverless) | Serverless, branching, HTTP SQL, costo 0 en dev |
| ORM | Drizzle | Typesafe, migraciones simples, compatible Neon |
| Email | Resend | API simple, dominio propio, entregabilidad alta |
| Deploy | Vercel | Preview por PR, env vars, edge functions |
| DNS | name.com | Ya tenemos 24 dominios, API automatizada |

## Stack por tipo de proyecto

### PWA con mapas (MT Empresarial, Ruta 618, RideMe)
+ Mapbox GL JS (mapas + rutas + geocoding)
+ Web Push VAPID (notificaciones sin app store)
+ Socket.io o Vercel Pusher (tiempo real)

### E-commerce / Pagos (Castores, V-Gift)
+ Stripe Checkout + Webhooks
+ Mercado Pago (alternativa LATAM)
+ Vercel Blob (imagenes de productos)

### SaaS / Multi-tenant (Crede-ti, VForge)
+ Stripe Subscriptions + Customer Portal
+ Clerk Organizations (multi-tenant nativo)
+ Neon branching por tenant

### PWA Mobile-first (Hakapoke, Hi Doc)
+ next-pwa (service worker)
+ manifest.webmanifest
+ Offline-first con cache strategies

## Lo que NO usar y por que
| Evitar | Alternativa | Razon |
|---|---|---|
| Firebase | Neon + Clerk | Vendor lock-in, costo escala mal |
| Prisma | Drizzle | Mas pesado, peor performance serverless |
| Redux | Zustand o Context | Overhead innecesario en proyectos medianos |
| Material UI | Design System propio | Generico, dificil de personalizar, pesado |
| Vercel KV | Neon | Ya tenemos Neon, innecesario otro servicio |
| Google Maps | Mapbox | Mejor API, mas barato a escala, mejor DX |
| SendGrid | Resend | API moderna, mejor DX, mismo precio |

## Versiones validadas (Junio 2026)
```
next: 14.x
typescript: 5.x
tailwindcss: 3.x
framer-motion: 11.x
@clerk/nextjs: 5.x
drizzle-orm: 0.30.x
drizzle-kit: 0.21.x
@neondatabase/serverless: 0.9.x
resend: 3.x
stripe: 15.x
mapbox-gl: 3.x
```

## package.json base
```json
{
  "dependencies": {
    "next": "14.2.x",
    "react": "18.x",
    "react-dom": "18.x",
    "typescript": "5.x",
    "@clerk/nextjs": "5.x",
    "drizzle-orm": "0.30.x",
    "@neondatabase/serverless": "0.9.x",
    "framer-motion": "11.x",
    "tailwindcss": "3.x",
    "resend": "3.x",
    "lucide-react": "latest",
    "next-themes": "0.3.x"
  },
  "devDependencies": {
    "drizzle-kit": "0.21.x",
    "@types/node": "20.x",
    "@types/react": "18.x"
  }
}
```

## Variables de entorno estandar
```env
# Auth
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_live_...
CLERK_SECRET_KEY=sk_live_...
CLERK_WEBHOOK_SIGNING_SECRET=whsec_...

# Database
DATABASE_URL=postgresql://...neon.tech/neondb?sslmode=require
DIRECT_URL=postgresql://...neon.tech/neondb?sslmode=require  # sin pooler, para migraciones

# Email
RESEND_API_KEY=re_...
RESEND_FROM_EMAIL=App <hola@dominio.com>

# Pagos (si aplica)
STRIPE_SECRET_KEY=sk_live_...
STRIPE_WEBHOOK_SECRET=whsec_...
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_live_...

# Mapas (si aplica)
NEXT_PUBLIC_MAPBOX_TOKEN=pk.eyJ1...

# Push (si aplica)
NEXT_PUBLIC_VAPID_PUBLIC_KEY=...
VAPID_PRIVATE_KEY=...
VAPID_SUBJECT=mailto:soporte@dominio.com

# App
NEXT_PUBLIC_APP_URL=https://dominio.com
```
