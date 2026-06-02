---
name: project-templates
description: Templates pre-armados de proyectos Next.js en Hetzner para scaffoldear rapido. En vez de crear 50 archivos uno por uno, clonar template y customizar. ACTIVAR cuando se cree un proyecto nuevo.
---
# Project Templates — Scaffold en 30 segundos

## Templates disponibles en Hetzner /home/templates/

### nextjs-full (Next.js 15 + Clerk + Prisma + Tailwind + shadcn)
Incluye:
- package.json con todas las deps
- next.config.ts
- tailwind.config.ts
- src/middleware.ts (Clerk)
- src/app/layout.tsx (ClerkProvider + theme)
- src/app/(public)/ landing, sign-in, sign-up
- src/app/(app)/ dashboard, perfil
- src/app/(admin)/ dashboard, users, settings
- src/lib/db.ts (Prisma client)
- src/lib/utils.ts
- src/components/ui/ (shadcn base)
- prisma/schema.prisma (base)
- .env.example

### Crear template
En Hetzner:
cd /home/templates && npx create-next-app@latest nextjs-full --typescript --tailwind --app --src-dir
Agregar Clerk, Prisma, shadcn, estructura de carpetas

### Usar template para nuevo proyecto
1. cp -r /home/templates/nextjs-full /tmp/{proyecto}
2. Customizar: colores, nombre, schema
3. git init + remote + push
4. Vercel auto-deploy

### Customizar por proyecto
Cada proyecto solo cambia:
- Colores en tailwind.config.ts y globals.css
- Schema de Prisma
- Paginas especificas del negocio
- La estructura base es identica para todos

## Crear template una sola vez
POST /brain/exec con script que crea el template completo.
Despues solo es cp + customizar + push.
