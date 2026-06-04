---
name: pwa-checklist
version: 1.0
description: Checklist de lo que debe tener una PWA antes de mostrarse al cliente. ACTIVAR al iniciar o revisar cualquier proyecto.
---
# PWA Checklist - MYMOMENTUM

## REGLA DE ORO
El usuario debe QUERER entrar antes de registrarse.
Nunca redirigir / a /registro automaticamente.

## 1. LANDING (/)
- Hero: headline fuerte + 2 CTAs (Ver demo / Crear cuenta)
- Que resuelve la app (3 puntos concretos)
- Como funciona (3 pasos simples)
- Para quien es
- CTA final hacia /registro
- Diseno: brand color oscuro, Playfair Display, FadeInOnScroll

## 2. FLUJO AUTH EN ORDEN
/ -> /registro -> /onboarding -> /dashboard
Sin saltar pasos. Sin redirect automatico desde /.

## 3. ONBOARDING
Usuario nuevo sin datos: pedir info minima, guardar DB, redirect dashboard.

## 4. ESTADOS VACIOS
Sin datos en DB: mensaje claro + CTA de accion. Nunca mock data hardcodeado.

## 5. PWA
- manifest.json: name, short_name, theme_color, icons 192+512
- public/icons/icon-192.png + icon-512.png con logo real
- sw.js basico en public/
- link rel manifest en layout.tsx

## 6. EMAIL (Resend)
- Bienvenida en user.created via webhook
- From: App <hola@dominio.com>

## 7. WEBHOOK CLERK
- /api/webhooks/clerk con verificacion svix
- user.created -> INSERT users
- user.updated -> UPDATE users
- user.deleted -> soft delete
- Excluir /api/webhooks/(.*) en middleware

## 8. MIDDLEWARE
Publico: / /login(.*) /registro(.*) /api/webhooks(.*)
Protegido: todo lo demas

## 9. DISENO
- Framer Motion: PageTransition, FadeInOnScroll, StaggerContainer, HoverCard, NumberCounter
- Design system propio. Sin shadcn generico.
- Dark mode o light premium. Consistente.
- Sin mezclar estilos.

## 10. BUILD
- npm run build sin errores
- Loading states en todas las fetches
- Error boundaries en rutas criticas

## ORDEN DE CONSTRUCCION (seguir siempre)
1. Landing que vende
2. Auth: registro + login
3. Onboarding
4. DB schema + API routes
5. Dashboard con datos reales
6. Estados vacios con CTA
7. PWA: manifest + iconos + sw.js
8. Webhook Clerk
9. Emails transaccionales
10. Deploy + task-supervisor

## PREGUNTA ANTES DE LANZAR
Le mostrarias esto a un cliente en demo sin avisar?
Si la respuesta es no -> no esta listo.
