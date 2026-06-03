---
name: pro-site-generator
description: Genera sitios web profesionales completos en una sola instruccion. Stack: Next.js + TypeScript + Tailwind + Framer Motion + design-system + Clerk. Deploy-ready para Vercel.
---
# Pro-Site Generator

## Magic Prompt (copiar y adaptar)
Crea un sitio profesional para [SECTOR/NEGOCIO].

Stack obligatorio:
- Next.js 14 App Router + TypeScript
- Tailwind CSS + design tokens de design-system skill
- Framer Motion (FadeInOnScroll, StaggerContainer, PageTransition, HoverCard)
- Clerk auth (/sign-in /sign-up)
- Componentes del design-system skill (Button, Card, Modal, Badge, Input, Alert)

Paginas a generar:
- / (landing: hero, features, social proof, CTA, footer)
- /[dashboard segun negocio] (protegida con Clerk)
- /sign-in y /sign-up

Secciones landing (TODAS con Framer Motion):
1. Hero: headline + subhead + CTA + visual animado
2. Features: grid 3 cols, StaggerContainer
3. How it works: pasos numerados, SlideIn
4. Social proof: logos o testimonials, FadeInOnScroll
5. Pricing (si aplica): cards con Badge
6. CTA final: fondo color, texto grande
7. Footer: links, copyright

Requisitos:
- Mobile-first, responsive (sm:640 md:768 lg:1024 xl:1280)
- Dark mode (next-themes)
- SEO: metadata, og:image
- Performance: next/image, lazy loading
- Loading states con Spinner, errores con Alert
- Proteger rutas dashboard con Clerk middleware

Deploy: vercel.json con headers de seguridad.

## Templates

### E-commerce (Castores, V-Gift)
Paginas extra: /shop, /product/[id], /cart, /checkout
Features: grid productos con HoverCard, carrito SlideIn, filtros AnimatePresence
DB: productos, pedidos en Neon
Pagos: Stripe Checkout

### SaaS (Crede-ti, VForge)
Paginas extra: /dashboard, /settings, /billing
Features: sidebar + PageTransition, onboarding wizard, NumberCounter
DB: users, subscriptions en Neon
Pagos: Stripe Subscriptions

### Service Platform (MT Empresarial, Ruta 618)
Roles: admin / driver / client
Paginas extra: /app, /driver, /admin
Features: role switching PageTransition, mapa Mapbox, stats NumberCounter
DB: users, services, assignments en Neon
Push: VAPID

### PWA Mobile-first (RideMe, Hakapoke)
Instalable: manifest.webmanifest + SW
Features: bottom navbar animada, gestos swipe, offline mode
DB: Neon + optimistic updates

## Estructura generada
app/
  layout.tsx          (Clerk + dark mode)
  page.tsx            (landing)
  sign-in/page.tsx
  sign-up/page.tsx
  dashboard/layout.tsx (sidebar + protected)
  dashboard/page.tsx
components/
  ui/                 (design-system)
  landing/            (Hero, Features, etc.)
lib/
  db.ts               (Neon + Drizzle)
  utils.ts
middleware.ts         (Clerk)

## Checklist de calidad
- Lighthouse > 90
- Sin console.error en build
- Todas las imagenes con next/image
- Metadata completo (title, description, og)
- Responsive en 320px, 768px, 1280px
- Dark mode funciona completo
- Auth completo (sign-in -> dashboard -> sign-out)
- Loading states en todas las fetches
- Error boundaries en rutas criticas
