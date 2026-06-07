---
name: manifiesto-app
description: El MANIFIESTO de VForge (V1): lo que TODA app debe tener si o si antes de declararse lista/cobrable. Base tecnica + Quality Manifest UX de Luis. ACTIVAR al cerrar/entregar cualquier app, en el gate de calidad, o cuando Luis diga manifiesto, que debe tener una app, checklist, esta lista para entregar, super perfecta, se siente amateur.
---
# VFORGE QUALITY MANIFEST V1 — lo que toda app debe tener SI O SI

Una app NO se evalua solo por funcionar. Se evalua por: sensacion, fluidez, velocidad, claridad, confianza y deseo de uso. **Si funciona pero se siente amateur, esta INCOMPLETA.** Principio final: si el usuario piensa "parece una pagina web", la app FALLO; debe pensar "parece una app de millones de dolares". Verificacion siempre EN VIVO (login real + screenshots movil 390px y desktop). Se candadea por fases segun [vforge-method].

## BLOQUE A — BASE TECNICA (sin esto nada cuenta)

A1. ACCESO QUE FUNCIONA DE VERDAD: registro + login ENTRAN (no rebotan). Clerk patron anti-loop: redirectToSignIn({returnBackUrl}) + signInUrl/signUpUrl propios + forceRedirectUrl al dashboard; UNA sola puerta. Onboarding guarda y deja entrar (migracion corrida). Clerk production: dominio VERIFICADO (clerk, accounts, clkmail, clk._domainkey, clk2._domainkey) o las pk_live no sirven.
A2. BACKEND REAL: datos de Neon, CERO mock en runtime; migraciones corridas; /api/health ok con conteos reales.
A3. UNA SOLA NAVEGACION: sin menus duplicados; todos los modulos accesibles.
A4. ICONO PWA = LOGO REAL: 192/512/maskable/apple-touch/favicon con la marca (skill icono-pwa).
A5. PWA REAL: manifest + service worker real + standalone + instalable + Splash Screen.
A6. CORREO: dominio verificado en Resend + envios reales probados desde from@dominio-propio.
A7. LEGAL Y SOPORTE: terminos, privacidad, contacto; aceptacion en registro.
A8. SEGURIDAD: secrets en env vars (nunca en repo), roles respetados, rutas protegidas.

## BLOQUE B — QUALITY MANIFEST UX (las 15 reglas de Luis)

B1. NO PUEDE BAILAR: header fijo, footer fijo, safe areas (env(safe-area-inset)), viewport-fit=cover, alturas consistentes, CERO layout shift. Debe sentirse Airbnb/Uber/Revolut/Mercado Pago, nunca plantilla Bootstrap ni app estudiantil.
B2. MOBILE FIRST: disenar iPhone → Android → Tablet → Desktop. Nunca al reves.
B3. EXPERIENCIA NATIVA: la PWA debe parecer App Store, no pagina web. Splash screen, iconos propios, animaciones suaves, estados de carga/vacios/error, pull-to-refresh, transiciones.
B4. DOPAMINE UX: sensacion de avance. Skeleton loaders al cargar; progress bars en registro/compras/pedidos/procesos; success animations (check/celebracion); micro-animaciones en botones/cards/menus/toggles/tabs; motion feedback — nada se siente muerto.
B5. HERO CINEMATOGRAFICO: toda app publica con hero visual (imagen/video fotorealista) que responda: quien eres, que haces, por que importa, que hago ahora.
B6. CARRUSELES OBLIGATORIOS en apps comerciales: promociones, productos, propiedades, eventos, beneficios, noticias, tutoriales. Generan permanencia.
B7. POPUPS INTELIGENTES: permitidos promos/onboarding/tutoriales/avisos; PROHIBIDOS invasivos, repetitivos o molestos.
B8. SCROLL INFINITO CONTROLADO donde aplique (productos, propiedades, eventos, contenido). No paginacion antigua.
B9. DARK MODE NATIVO en TODAS las apps: claro + oscuro + automatico. Sin excepcion.
B10. DISENO NO GENERICO: prohibido templates/AdminLTE/Bootstrap clasico/dashboards viejos. Branding propio, personalidad visual, identidad clara. CERO dorado salvo orden explicita de Luis. El V Orb solo en vforge.site.
B11. PANEL ADMIN PREMIUM: debe sentirse Stripe/Notion/Linear/Hubspot/Mercado Pago, nunca sistema de 2015. Cards, analytics, KPIs reales, filtros, busquedas, acciones rapidas, CRUD real, estados vacios con CTA.
B12. CONTENIDO DINAMICO (CMS): textos, banners, imagenes, promociones, FAQs y notificaciones modificables SIN tocar codigo.
B13. VELOCIDAD: primer render < 2s. Lazy load, image optimization, code splitting, caching, CDN.
B14. EFECTO WOW: los primeros 15 segundos deben provocar "esto se ve caro / parece app grande / quiero seguir viendo". Permitidos: glassmorphism, blur, parallax, gradientes, video hero, Lottie, 3D ligero. (El wow va ENCIMA de la base estable, nunca en vez de ella.)
B15. PUSH NOTIFICATIONS reales (VAPID) cuando la app lo amerite.

## CHECKLIST DE ENTREGA VFORGE (gate final)

Hero cinematografico · Splash screen · Dark mode · Mobile first · Tablet · Desktop · Carruseles · Push · Dashboard premium · Analytics · CMS · Animaciones · Seguridad · Velocidad · Branding · Efecto WOW · Sensacion nativa · Login/onboarding entran · Datos reales · Icono PWA real · Correo real · Legal.

Gate operativo: (1) screenshot movil 390px del flujo principal; (2) scroll test header/footer fijos; (3) cero errores visibles; (4) las 3 EVIDENCIAS de vforge-method (visual + funcional + operativa en produccion); (5) si algo falla → iterar, no reportar "listo". Documentar cierre en brain (cierre-<app>).

Reglas de proceso: un ejecutor por repo; commits con la cuenta del team de Vercel; rollback si algo rompe; ver-logs antes de adivinar.

B16. NAVEGACION ABIERTA (regla Airbnb — obligatoria en TODA app que vende algo): el visitante SIN cuenta recorre, ve y explora libremente el catalogo/oferta (productos, servicios, eventos, planes) desde la home. El registro/login se pide SOLO al momento de actuar (comprar, reservar, contratar, guardar). PROHIBIDO: home que redirige a login/admin, catalogos cerrados, paywalls de exploracion. El modo admin va exclusivamente por su liga especial y NUNCA secuestra la home. Aplica a iStore, Yerro, LN RED, CSN, Decaciones, Tortillap, Hakapoke y toda app comercial del ecosistema. (Definida por Luis 8 jun 2026: 'si no, es tonto pensar en como vender'.)