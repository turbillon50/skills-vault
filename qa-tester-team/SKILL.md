---
name: qa-tester-team
description: Equipo profesional de QA en bucle. Despliega varios testers que prueban una app contra la Definicion de Terminado, reportan bugs, los builders corrigen, y se vuelve a correr en varias pasadas hasta quedar perfecto. ACTIVAR cuando Luis diga "testers", "que lo prueben", "ciérralo perfecto", "varias pasadas", "equipo de QA", o cuando una app deba quedar lista para entregar a cliente.
---
# QA Tester Team — bucle hasta perfecto

Objetivo: ninguna app se declara "lista" hasta pasar varias rondas de prueba real (no "se ve bien"), con evidencia visual en movil Y desktop, vista usuario Y admin.

## Roles (por app, en paralelo)
1. **Tester funcional** — recorre cada flujo del spec end-to-end (registro, login, flujo principal, admin, casos borde). Marca PASA/FALLA con evidencia.
2. **Tester visual/estabilidad** — screenshot 390px y 1280px; verifica la Definicion de Terminado: header/footer fijos sin tartamudeo, cero layout shift, inputs premium, estados vacios con CTA, sin errores en pantalla, paleta del design-system (cero dorado/beige), sin V Orb en apps de cliente.
3. **Tester de datos** — confirma datos reales de Neon (cero mock), health endpoint ok, navegacion existente intacta (no quitar items que ya existian).
4. **Builder de fix** — recibe el reporte de bugs y corrige; push a main; deploy READY.

## Bucle (repetir hasta 0 bugs criticos/altos)
PASADA N:
  - Cada tester corre y escribe REPORTE: lista de hallazgos (severidad: critico/alto/medio/bajo, evidencia, archivo/ruta).
  - Builder corrige en orden de severidad, push, verifica deploy READY.
  - Si quedaron hallazgos -> PASADA N+1. Si 0 criticos/altos y medios bajo control -> CERRADO.
- Minimo 2 pasadas aunque la primera salga limpia (la confianza no basta).

## Reglas
- Antes de tocar UI: leer user/design-system, user/framer-motion, mymomentum-standards (paso 8 runbook).
- Probar SIEMPRE en vista usuario y admin, movil y desktop.
- No quitar funcionalidad/navegacion existente para meter lo nuevo.
- Documentar en el brain (brain_files 'qa-<app>') el reporte final y el estado.
- Entregable: tabla por pasada (hallazgo -> fix -> estado) + screenshots finales aprobables de un vistazo.

## Verificacion final (task-supervisor)
curl /api/health, dig dominio, build limpio, y screenshots de los 4 cuadrantes (usuario-movil, usuario-desktop, admin-movil, admin-desktop).
