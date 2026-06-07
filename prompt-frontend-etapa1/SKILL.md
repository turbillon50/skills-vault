---
name: prompt-frontend-etapa1
description: Plantilla de PROMPT PERFECTO para construir frontends Etapa 1 (demo navegable) en v0/Claude Code a partir de mockups + logo, adaptable a CUALQUIER negocio. ACTIVAR al arrancar la demo de un cliente nuevo (Fase 1 del vforge-method), cuando Luis mande mockups/imagenes de referencia, o diga "construye el frontend", "demo en v0", "prompt para v0". Validada por v0 con contexto de VForge (8 jun 2026).
---
# PROMPT PERFECTO — FRONTEND ETAPA 1 (plantilla universal)

Uso: copiar, llenar los [campos] con los datos del cliente, adjuntar mockups + logo, y mandar a v0 o a un ejecutor Claude Code. Es el prompt oficial de la Fase 1 (Demo navegable GRATIS) del vforge-method.

PLANTILLA (verbatim):

# PROYECTO: [Nombre del producto]
Adjunto: [N] imagenes de referencia → [mockup de pantallas] + [logo/marca].

## 1. CONTEXTO
- Que es: [1 frase].
- Para quien: [usuarios/roles].
- Tono de marca: [3 adjetivos].

## 2. ALCANCE DE ESTA ETAPA (Etapa 1 — metodo VForge)
- Entregable: UI navegable en preview, mobile-first. SIN backend, SIN auth real.
- Datos: mock data centralizado en lib/mock-data.ts, realista y consistente entre pantallas (mismos IDs, nombres, estados, ciudades).
- Etapas siguientes conectaran [stack futuro]; NO implementarlo ahora, pero dejar la estructura lista.

## 3. SUPERFICIES A CONSTRUIR (rutas)
Por cada pantalla del mockup, una ruta: / (landing), /app (cliente mobile-first), /[rol], /admin (lista EXACTA del sidebar de la imagen).
Regla: si un elemento aparece en la imagen (tab, KPI, boton) debe existir y ser navegable. No omitir nada visible. No inventar pantallas que no se ven.

## 4. FIDELIDAD VISUAL (no negociable)
- Paleta EXACTA del logo/mockup, max 5 colores, como design tokens en globals.css. Nada hardcodeado.
- Tipografia: max 2 familias. Copy: textos EXACTOS de las imagenes (taglines, labels, KPIs, telefonos).
- Logo recreado como componente SVG nitido (fondo claro y oscuro). Iconos lucide, nunca emojis. Imagenes reales, nunca placeholders.

## 5. COMPORTAMIENTO ESPERADO
- Navegacion real entre superficies. Estados interactivos [buscadores, filtros, tabs, toggle de tema]. Flujos clave funcionando [lista corta]. Mapas con libreria establecida o mapa mock reutilizable, nunca SVG a mano.

## 6. ESTANDARES TECNICOS
Next.js App Router + Tailwind + shadcn/ui. Componentes pequenos reutilizables (status-badge, mock-map, kpi-card), no un page.tsx gigante. Mobile-first real: touch ≥44px, inputs ≥16px, sin auto-zoom iOS. PWA: manifest + theme-color de marca. Accesibilidad: semantica, ARIA, alt, contraste.

## 7. CRITERIO DE ACEPTACION (DoD)
[ ] Todas las pantallas de las imagenes existen y son navegables. [ ] Paleta, copy y KPIs coinciden. [ ] Compila sin errores, verificado movil+desktop. [ ] Mock data consistente. [ ] Tema claro/oscuro y PWA funcionando.

## 8. AL TERMINAR
Resumen de rutas construidas + que queda listo para Etapa 2. No conectar servicios reales.

NOTAS VULCANO: encadena con [demo-screens] y [demo-pwa-builder] (este prompt los supera en fidelidad por exigir copy/paleta EXACTOS del mockup); el resultado debe pasar [manifiesto-app] Bloque B antes de mostrarse al cliente.