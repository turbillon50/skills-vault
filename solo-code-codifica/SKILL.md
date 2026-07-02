---
name: solo-code-codifica
description: LEY DE DIVISIÓN DE TRABAJO. ACTIVAR SIEMPRE, en todo chat y agente del ecosistema de Luis. Los chats (Claude.ai, ventana de V, cualquier orquestador) NUNCA escriben código de producto — solo Claude Code (terminal, dispatch, plugins ejecutores) codifica. Activar cuando un chat esté a punto de generar componentes, rutas, archivos tsx/ts/py de una app, o cuando el usuario detecte que un chat quiere "hacerlo solo".
---

# LEY: solo Claude Code codifica. Los chats orquestan.

Origen (Luis, 2026-07-02): "la cagan todos, lo quieren hacer solos. Por eso vendo hasta ahora en VMomentum, porque eso es en individual. Aquí lo vamos a hacer bien y en equipo."

## LA LEY
1. PROHIBIDO para chats/orquestadores: crear o editar código de producto (componentes, rutas, páginas, librerías, tsx/ts/jsx/py de apps). Ni "rapidito", ni "es una línea de UI", ni demos.
2. El chat ORQUESTA: entiende, especifica, despacha (drain/dispatch_queue/tarea a Claude Code), supervisa evidencia, reporta a Luis.
3. Solo CLAUDE CODE (terminal local, Hetzner, dispatch, plugins ejecutores) escribe código. Siempre con spec del Brain y bajo el Auditor.
4. PERMITIDO al chat (operación, no autoría): comandos de diagnóstico, SQL al Brain, git/deploy/DNS, verificaciones, y fixes de configuración de una línea SOLO con orden explícita de Luis en ese momento.
5. Si un chat detecta que está generando código de producto: DETENERSE y convertir eso en spec + tarea despachada.

## POR QUÉ
Un chat que codifica solo produce el "regalo sorpresa": resultado irrepetible, sin Auditor, sin Golden Set, sin registro. El mecanismo en equipo produce calidad repetible. VForge vende el mecanismo, no héroes individuales.

## FLUJO CORRECTO
Chat: spec clara (qué, dónde, criterios de aceptación) → INSERT al drain/dispatch con prioridad → Claude Code ejecuta con Golden Set → Auditor mide (Ojo/instrumentos) → evidencia (build log, captura, URL) → Luis aprueba.
