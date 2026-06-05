---
name: project-closer
version: 1.0
description: Seguimiento y cierre de proyectos MYMOMENTUM. Define etapas, checklist por etapa y criterio de entrega. ACTIVAR cuando un proyecto necesita seguimiento estructurado hasta entrega final al cliente.
---
# Project Closer — MYMOMENTUM

## Etapas de un proyecto

### ETAPA 1: DEMO
El cliente ve algo funcionando antes de pagar o firmar.
Checklist:
- [ ] Landing que vende (no redirige al registro)
- [ ] Flujo demo publico sin cuenta (/demo)
- [ ] Diseno con colores y tipografia de la marca
- [ ] Mobile-first, se ve bien en celular
- [ ] PWA: se puede instalar en pantalla de inicio
- [ ] Datos de ejemplo plausibles (no lorem ipsum)

Criterio de salida: el cliente lo abre y entiende que es.

---

### ETAPA 2: CONEXION
La app esta conectada a servicios reales.
Checklist:
- [ ] Clerk production con dominio real (pk_live_)
- [ ] DNS verificados: A, www, clerk, accounts, clkmail, dkim
- [ ] Neon DB con schema completo
- [ ] Resend con from: hola@dominio.com
- [ ] Webhook Clerk: user.created/updated/deleted
- [ ] Mercado Pago o Stripe con keys reales
- [ ] Todas las env vars en Vercel (no TEST_, no placeholder)
- [ ] task-supervisor: verificar con curl/dig antes de declarar listo

Criterio de salida: un usuario real puede registrarse y la DB lo guarda.

---

### ETAPA 3: PRUEBAS
El flujo completo funciona de principio a fin.
Checklist:
- [ ] Registro -> onboarding -> dashboard (sin errores)
- [ ] Onboarding pide datos relevantes del negocio
- [ ] Dashboard muestra datos reales (no mock)
- [ ] Estados vacios con CTA cuando no hay datos
- [ ] Pagos funcionan (flujo Mercado Pago o Stripe)
- [ ] Emails transaccionales llegan
- [ ] Admin panel funciona con rol correcto
- [ ] PWA instalable y navegable sin internet (cache basico)
- [ ] build: npm run build sin errores

Criterio de salida: el cliente puede usarlo solo sin ayuda.

---

### ETAPA 4: ENTREGA FINAL
Traspaso al cliente.
Checklist:
- [ ] Capacitacion: video o sesion de 30 min
- [ ] Documentacion basica: como agregar usuarios, como ver reportes
- [ ] Accesos entregados: dominio, Clerk dashboard, Vercel
- [ ] Segundo pago cobrado (segun contrato)
- [ ] Repositorio privado o acceso a GitHub
- [ ] Soporte inicial: 48h respuesta prometida

Criterio de salida: cliente firma conformidad o confirma por escrito.

---

## Estado por proyecto (actualizar al avanzar)

| Proyecto | Etapa actual | Bloqueado por |
|---|---|---|
| MT Empresarial | 3 Pruebas | Scaffold Next.js + webhook code |
| Decaciones | 2 Conexion | Cover Flow completo |
| Yerro Fiscal | 3 Pruebas | Landing + onboarding fiscal |
| CSN Carnes | 2 Conexion | Prompt con datos reales pendiente |
| Ruta 618 | 2 Conexion | Clerk dev (sin production) |
| Tortillap | 1 Demo | Next.js completo + flujo SaaS |

## Como usar esta skill en Claude Cowork

Al iniciar sesion de trabajo:
1. Fetch boot-context: GET http://178.105.135.26/brain/file/boot-context.md
2. Definir proyecto del dia
3. Identificar etapa actual
4. Revisar checklist de la etapa
5. Resolver un bloqueante a la vez
6. Al terminar: task-supervisor verifica, registrar en skill_runs

## Prompt de arranque por proyecto

Pegar al inicio de cada Claude Code:

---
Proyecto: [NOMBRE]
Repo: turbillon50/[repo]
Dominio: [dominio]
Etapa actual: [1-4]
Bloqueante: [que falta exactamente]

Skills obligatorias:
git clone https://github.com/turbillon50/skills-vault /tmp/sv
cat /tmp/sv/user/framer-motion/SKILL.md
cat /tmp/sv/user/design-system/SKILL.md
cat /tmp/sv/pwa-checklist/SKILL.md

[descripcion de la tarea especifica]
---

## Criterio final de cierre
El proyecto esta cerrado cuando:
1. El cliente puede usarlo solo
2. El pago esta liquidado
3. Los accesos estan entregados
4. Hay un canal de soporte activo (WhatsApp o email)
