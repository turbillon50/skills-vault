---
name: entrega-cliente
description: VFORGE CLIENT DELIVERY MANIFEST V1 — fase OBLIGATORIA entre demo y desarrollo. Convierte "que bonita app" en "donde firmo". Dossier/micrositio de entrega (nunca liga sola), kit de identidad y Centro de Proyecto para reportes. ACTIVAR cuando se entregue una demo a cliente, se prepare propuesta/cotizacion/dossier, Luis diga "entregar al cliente", "propuesta", "presentar demo", "donde firmo", o al pasar un proyecto de demo a contrato.
---
# VFORGE CLIENT DELIVERY MANIFEST V1 — fase demo → contrato

Fase OBLIGATORIA entre demo y desarrollo. Objetivo: transformar "que bonita app" en "¿donde firmo?".

## PAQUETE DE ENTREGA DEMO

Cada demo se entrega dentro de un MICROSITIO o dossier digital. **NUNCA una liga sola.** Estructura (10 secciones, en este orden):

1. **Cover Premium** — portada institucional: logo cliente + logo VMomentum + nombre del proyecto + fecha + imagen hero. Ej: "APSUS — Plataforma Integral de Microcreditos. Presentado por VMomentum".
2. **Carta de Presentacion** — max 1 pagina: que vimos, que entendimos, que proponemos.
3. **Demo** — boton principal "Ver Demo" (aqui va la liga; la demo cumple manifiesto-app).
4. **Resumen Ejecutivo** — problema actual, solucion propuesta, beneficios, tiempo estimado.
5. **Arquitectura** — visual, bonita, tipo Apple: Cliente → App → Administracion → Base de datos → Integraciones.
6. **Alcance** — que incluye, que NO incluye, que se puede agregar.
7. **Integraciones Propuestas** — ej: Clerk, Neon, Resend, Stripe, Mercado Pago, WhatsApp, Maps, Facturapi.
8. **Roadmap** — Etapa 1 / Etapa 2 / Etapa 3.
9. **Inversion** — plan seleccionado, calendario de pagos, stores, mantenimiento.
10. **Contratacion** — contrato, NDA, anexos, alcance, BOTON DE FIRMA.

## KIT DE IDENTIDAD (obligatorio en toda propuesta, aunque sea preliminar)

Logo, paleta, tipografia, mockups, aplicacion movil, dashboard, experiencia visual.

## REPORTE DE AVANCE — Centro de Proyecto

PROHIBIDO reportar por WhatsApps sueltos, audios o mensajes aislados. Cada proyecto tiene su **Centro de Proyecto**: `proyecto.vmomentum.site/<cliente>` con: estado, porcentaje, pendientes, entregables, historial, comentarios, archivos.

## REPORTES AUTOMATICOS (Resend)

Cada cambio de estado del proyecto genera un CORREO AUTOMATICO via Resend (desde dominio propio verificado). Formato ejemplo: "Proyecto APSUS — Estado actualizado. 72%. Modulo CRM completado. Modulo Cobranza en progreso. Fecha estimada: 15 junio." Trigger: update en client_project_status del brain → correo al cliente + link a su Centro de Proyecto.

## ONBOARDING POST-FIRMA (automatico)

Una vez firmado el contrato,