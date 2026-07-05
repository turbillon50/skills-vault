---
name: reverse-engineering
description: Ingeniería inversa de apps, APIs, código legacy, endpoints, esquemas de DB, flows de pago, estructuras de proyectos. ACTIVAR cuando el usuario diga "ingeniería inversa", "clona esto", "cómo funciona X por dentro", "deconstruye", "analiza esta app", "reverse engineer", "mapea el flow", "entiende cómo hicieron", "copia el comportamiento de".
---

# Reverse Engineering — Desentraña cualquier sistema

Mapea, analiza y replica el comportamiento de apps, APIs y flujos sin acceso al código fuente.

## Cuándo usar
- Replicar funcionalidad sin código fuente
- Documentar APIs o flujos de pago desconocidos
- Mapear estructura de DB legacy
- Entender cómo está hecha una app competidora

## Reglas
- Nunca violar TOS ni leyes de propiedad intelectual
- Documenta cada paso para validación del equipo
- Usa herramientas de diagnóstico antes de tocar código (cURL, DevTools, mitmproxy)
- Prioriza información pública antes de interceptar tráfico

## Pasos
1. Definir objetivo — qué parte del sistema se desentraña
2. Recolectar info pública — docs, repos, blogs, foros
3. Interceptar tráfico — mitmproxy o Fiddler durante sesión activa
4. Mapear endpoints — URLs, métodos, headers, bodies, responses
5. Identificar esquemas de datos — analiza payloads, genera JSON schemas
6. Explorar DB si hay acceso — tablas, claves, relaciones (Neon/Postgres)
7. Recrear flujo — diagramas Mermaid o draw.io
8. Generar código de referencia — snippets Next.js para replicar calls
9. Validar comportamiento — contrasta con app original
10. Entregar — docs, diagramas, ejemplos y checklist de riesgos

## Errores conocidos
| Error | Causa | Fix |
|---|---|---|
| Bloqueo CORS | API rechaza peticiones externas | Usar proxy o headers correctos |
| Rate limiting | Demasiadas calls seguidas | Throttling + espera entre requests |
| Datos ofuscados | Respuestas cifradas | Inspección de código cliente |
| Endpoints dinámicos | Tokens temporales en URL | Capturar durante sesión activa |
| Esquemas incompletos | Info pública parcial | Complementar con pruebas de frontera |

## Ejemplo
Input: "Quiero replicar el checkout de Stripe que usa esta tienda sin acceso al backend"
Output: mapa de endpoints, JSON schemas, código Next.js helper, diagrama Mermaid del flujo
