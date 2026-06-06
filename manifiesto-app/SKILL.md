---
name: manifiesto-app
description: El MANIFIESTO de VForge: lo que TODA app debe tener si o si antes de declararse lista/cobrable. Definicion de Terminado oficial + checklist de cierre. ACTIVAR al cerrar/entregar cualquier app, en el gate de calidad, o cuando Luis diga manifiesto, que debe tener una app, checklist, esta lista para entregar, super perfecta.
---
# MANIFIESTO — lo que toda app VForge debe tener SI O SI

Ninguna app se declara lista/cobrable sin cumplir TODO esto, verificado EN VIVO (login real + screenshots movil 390px y desktop). Lista viva: se agrega cada leccion nueva.

1. ACCESO QUE FUNCIONA DE VERDAD: registro + login ENTRAN (no rebotan). Clerk patron anti-loop: redirectToSignIn({returnBackUrl}) + signInUrl/signUpUrl propios + forceRedirectUrl al dashboard; UNA sola puerta (no Account Portal + embebido a la vez). El ONBOARDING guarda y deja entrar (su migracion corrida; nada de "Hubo un problema"). Clerk production: el dominio debe estar VERIFICADO (todos los DNS: clerk, accounts, clkmail, clk._domainkey, clk2._domainkey) o las pk_live no funcionan.
2. BACKEND REAL CONECTADO: datos reales de Neon, CERO mock en runtime; la MIGRACION de tablas CORRIDA en la base correcta; /api/health responde ok con conteos reales.
3. UNA SOLA NAVEGACION: sin menus duplicados (no un hamburguesa que repita la barra inferior); TODOS los modulos accesibles desde la nav o "Mas".
4. ICONO PWA = LOGO REAL: icon-192/512/maskable/apple-touch/favicon con la marca; al instalar sale el LOGO, no blanco ni el de v0/Vercel (skill icono-pwa).
5. PWA INSTALABLE: manifest.webmanifest + service worker real (no kill-switch) + display standalone + instalable.
6. ESTABILIDAD: header/footer fijos con env(safe-area-inset), viewport-fit=cover, CERO layout shift, inputs premium con estados, skeletons en vez de pantallas en blanco, sin errores visibles (nada de "Forbidden"/"undefined"/500 en pantalla).
7. IDENTIDAD: design-system; CERO dorado salvo orden explicita de Luis; el V Orb NO va en apps de cliente (solo vforge.site).
8. CORREO: dominio VERIFICADO en Resend + envios reales probados (bienvenida, invitacion, alertas) desde from@dominio-propio (no onboarding@resend.dev).
9. LEGAL Y SOPORTE: terminos, aviso de privacidad, contacto/soporte; aceptacion en el registro.
10. PANEL ADMIN nivel CSN cuando aplique: CRUD real, KPIs reales, roles, estados vacios con CTA.
11. VERIFICACION EN VIVO antes de "listo": login real + recorrido + screenshots movil/desktop. Documentar el cierre en el brain (cierre-<app>) = experiencia de V.

Reglas de proceso: un ejecutor por repo; commits firmados con la cuenta del team de Vercel (si no, deploy BLOCKED); rollback si algo rompe; ver-logs antes de adivinar.
