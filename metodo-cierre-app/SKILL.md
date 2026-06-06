---
name: metodo-cierre-app
description: Metodo oficial VForge para CERRAR una app en loop positivo hasta dejarla bien y documentarla. ACTIVAR siempre que se vaya a terminar/cerrar/entregar una app, o cuando Luis diga cerrar, terminar, dejar bien, loop, ronda, cierre.
---
# Metodo de cierre de app (loop positivo)

Un ejecutor que ESCRIBE + auditores que solo LEEN en paralelo + un director que coordina y verifica en vivo. Centraliza la escritura (cero colision), paraleliza la auditoria (lectura segura).

## Roles
- EJECUTOR UNICO (uno por repo): Claude Code en el Hetzner (178.105.135.26) disparado via POST /brain/exec con `nohup claude -p "$(cat tarea.md)" --allowedTools "Bash Edit Write Read Glob Grep" > log &` (NO usar --dangerously-skip-permissions como root: lo bloquea; usar --allowedTools). Tiene .env local, red a Neon, disco real, git+PAT. Hace TODAS las escrituras/push/deploy.
- AUDITORES/TESTERS (N en paralelo, Cowork, SOLO LECTURA): prueban en vivo el frontend, el acceso/login real, datos reales vs mock, movil 390px + desktop, sin dorado, PWA. Reportan hallazgos por severidad (critico/alto/medio). NO escriben, NO push.
- DIRECTOR (Dispatch/yo): junta hallazgos -> los pasa al ejecutor -> corrige -> siguiente ronda. Retira agentes cumplidos, genera nuevos si hace falta. Verifica EN VIVO en el navegador del usuario.

## Pasos
1. SCOPE: definir que = "cerrada" (resultado deseado, UNA sola version, acceso que funciona, datos reales o demo honesto).
2. RONDA: ejecutor construye una ronda -> auditores prueban -> hallazgos al director -> ejecutor corrige.
3. Repetir rondas hasta 0 criticos/altos. Minimo 2 rondas aunque salga limpio.
4. VERIFICACION EN VIVO: el director entra en el navegador REAL del usuario (login real, se ve bien). El usuario da el visto bueno final.
5. DOCUMENTAR: al cerrar, escribir en el brain `brain_files` name 'cierre-<app>' con: que es, que se hizo, como se entra (URL/llave), trampas, que falta. = experiencia de V.

## Reglas duras
- UN ejecutor por repo a la vez. Paralelizar ENTRE apps distintas, no DENTRO.
- Cero dorado (paleta-luis). Leer design-system antes de tocar UI.
- Nada se declara listo sin verificacion en vivo en el navegador del usuario.
- Bug recurrente de Clerk (rebote/loop): redirectToSignIn + signInUrl/signUpUrl propios + forceRedirectUrl/fallbackRedirectUrl al dashboard; una sola puerta (no Account Portal + embebido).
