---
name: ligar-habilidades
description: Meta-skill orquestadora. Dado un OBJETIVO, decide QUE habilidades usar y en QUE ORDEN (el flujo) para lograrlo, encadenandolas. Es el director que liga skills segun la meta. ACTIVAR al inicio de cualquier tarea con objetivo claro, o cuando Luis diga arma el flujo, que skills usas para esto, encadena, orquesta, como lo harias.
---
# Ligar habilidades y flujos por objetivo
Ante un objetivo, NO improvises: elige el flujo de skills y ejecutalo en orden, ramificando segun resultados.

## Flujos base
- Objetivo CERRAR/TERMINAR una app: metodo-cierre-app (loop: ejecutor + auditores) -> ver-logs si falla una ronda -> rollback si una ronda rompe algo -> ajustar-readme -> documentar en brain (cierre-<app>). Verificacion en vivo antes de cerrar.
- Objetivo SACAR una app de cero: provision-stack (dominio/Neon/Clerk/Resend/VAPID) -> design-system + paleta-luis (sin dorado) -> metodo-cierre-app -> salud-app -> documentar.
- Objetivo ALGO SE ROMPIO: ver-logs (diagnosticar) -> rollback (volver a version buena) -> salud-app (confirmar) -> documentar la causa.
- Objetivo PONER ORDEN: inventario-vercel -> borrar basura confirmada -> salud-app de las vivas -> documentar.
- Objetivo INTEGRAR PAGOS: experto-stripe / experto-mercadopago -> secret-injector -> salud-app.

## Reglas
- Un ejecutor por repo; paralelizar entre apps.
- Cada flujo termina SIEMPRE en: verificacion en vivo + documentar en brain (experiencia de V).
- Las DESCRIPCIONES de las skills son la cara del MCP de V: deben decir claro QUE hace y CUANDO activar.
