---
name: clerk-automation
description: Automatizar Clerk Dashboard via Playwright. Crear apps, switch production, obtener API keys, configurar dominios. ACTIVAR cuando necesites crear o configurar una app de Clerk programaticamente.
---
# Clerk Automation via Playwright

## Login
1. Ir a dashboard.clerk.com/sign-in
2. Llenar email turbillon50@gmail.com
3. Clerk manda codigo por email (NO usa password)
4. Leer codigo de Gmail via IMAP (app password: ctsosjybkhtyblpe)
5. Teclear codigo digit by digit con page.keyboard.type(code, delay=100)
6. Guardar session: ctx.storage_state(path='/home/clerk-session.json')

## Crear app
1. Login o usar session guardada
2. Navegar a dashboard.clerk.com/apps
3. Click "Create application"
4. Llenar nombre en primer input visible
5. Click boton "Create"
6. Extraer keys con regex: pk_test_[A-Za-z0-9]+ y sk_test_[A-Za-z0-9]+

## Switch a Production (PROBLEMA CONOCIDO)
El selector "development" en la sidebar es un componente custom de Clerk, no un select ni button standard.
Posicion conocida: x=1139 y=70 en viewport 1280x800.

### Estrategia 1: Mouse click directo
page.mouse.click(1139, 70)
Esperar 3s, buscar texto "production" en lo que aparezca.

### Estrategia 2: Keyboard navigation
Tab hasta el elemento, Enter para abrir, Arrow down para production.

### Estrategia 3: URL directa
Si conoces el production instance ID, navegar directo:
dashboard.clerk.com/apps/{APP_ID}/instances/{PROD_INSTANCE_ID}

### Estrategia 4: Clerk Backend API
No existe API para switch de instancia. Solo puedes consultar la instancia actual.

### FALLBACK: Pedir a Luis
Si ninguna estrategia funciona, pedirle que haga el switch manual (30 seg) y pase el screenshot con los DNS records.

## Configurar dominio (post-production)
Clerk pide DNS records al activar production. Agregar via name.com API:
- CNAME para auth subdomain
- TXT para verificacion

## Errores conocidos
- Clerk session expira rapido, siempre intentar con session guardada primero, login como fallback
- El codigo de verificacion cambia cada vez, siempre leer el MAS RECIENTE de Gmail
- Clerk FREE/Hobby SI soporta production instances
