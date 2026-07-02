---
name: vforge
description: Contexto completo de VForge (vforge.site) — roles Owner/Associate/Client, módulos, CMP, diseño obsidian, stack técnico e infraestructura. Activar cuando se mencione VForge, la forja, forge, o se trabaje en /root/vforge en Hetzner.
triggers:
  - VForge
  - vforge.site
  - la forja
  - forge
  - CMP
  - Context Minimum Protocol
  - plataforma de clientes
---

# VForge — Skill de Contexto Completo

## Activar cuando
- El usuario mencione "VForge", "vforge.site", "la forja", "forge"
- Se trabaje en el repo `/root/vforge` en Hetzner
- Se discuta arquitectura de producto, roles, CMP, o diseño del sitio
- Se necesite contexto sobre roles Owner/Associate/Client

---

## Qué es VForge

**VForge** (`vforge.site`) es una fábrica de aplicaciones construida por Luis de la Torre (All Global Holding LLC).

**Posicionamiento**: "Entras con una idea. Sales con un producto real."

- Dominio: `vforge.site`
- Repo: `/root/vforge` en Hetzner `178.105.135.26`
- Deploy: Vercel (pendiente)
- Stack: Next.js, Clerk, Neon, Stripe, Tailwind

---

## Roles

### 👑 Owner — Luis (SAGRADO)
Acceso total. El área **V privada** es EXCLUSIVA de Luis, nunca visible para otros roles.
- Dashboard global todos los proyectos
- V privada: multi-repo GitHub, vault cifrado, tokens personales
- Admin: invitar usuarios, gestionar roles, aprobar CMP
- Social Connect: vincular todas las redes
- Contratos, facturación, blog

### 🤝 Associate — Jimmy
Todo excepto la V privada de Luis.
- Todos los proyectos de clientes
- CMP: revisar y aprobar ideas
- Social Connect (admin)
- Contratos, comentarios, deployments

### 🚀 Client — Usuario
Entra **solo por invitación** (WhatsApp o admin). Sin registro público aún.
- CMP onboarding al entrar
- Workspace propio: status, timeline, tokens, contratos, chat

---

## Módulos

| Módulo | Estado | Notas |
|--------|--------|-------|
| / Landing | LIVE — fix needed | Scroll roto, negro plano, falta contenido |
| CMP Module | PRIORIDAD | 6 pasos: captura→análisis→diseño→roadmap→scope→proyecto |
| V Privada | LIVE | Solo owner. Vault cifrado, multi-repo GitHub |
| Client Workspace | Por construir | Status, timeline, tokens, contratos, chat |
| eCommerce | LIVE — sin contenido | Stripe listo, falta contenido real |
| Blog 37 declaraciones | Por construir | Human-written por Luis, NO auto-generar |
| Social Connect | Por construir | Discord, Reddit, IG, X, LinkedIn, WA, YT |
| Developers | PRÓXIMAMENTE | No construir ahora |

---

## CMP — Context Minimum Protocol

El módulo estrella. Flujo de 6 pasos:
1. **Captura** — texto libre o voz (WhatsApp)
2. **Análisis AI** — competencia, mercado, localidad (Claude + Vulcano)
3. **Dirección visual** — estética y referentes
4. **Roadmap** — MVP → V1 → V2 con tiempos y costos
5. **Scope** — qué incluye MVP, qué queda fuera
6. **Proyecto creado** — notifica a Luis + Jimmy, genera workspace del cliente

---

## Diseño — Reglas Críticas

```css
--obsidian: #0A0A0F   /* NUNCA #000000 */
--blue: #0051FF
--purple: #7C3AED
--green: #00E5A0
--gold: #F5A623
--pearl: #E8E8F8
--muted: #5A5A8A
```

1. Negro obsidian `#0A0A0F`, NUNCA `#000000`
2. Grain overlay sutil (opacity 0.35–0.5)
3. Gradientes radiales para profundidad
4. box-shadow en múltiples capas
5. font-weight 900 + letter-spacing negativo en títulos
6. WCAG AA en modo día (4.5:1 mínimo)
7. **PROHIBIDO Lucide** → Phosphor Icons o SVG custom
8. **PROHIBIDO** colores stock (Material, Bootstrap)
9. Mobile-first: 375 / 768 / 1440px
10. Parallax, múltiples z-layers, popups animados

---

## Stack

| Capa | Tech |
|------|------|
| Frontend | Next.js 14+ App Router |
| Auth | Clerk (roles via metadata) |
| DB | Neon Postgres |
| Deploy | Vercel |
| Pagos | Stripe |
| WA / SMS | Twilio |
| Email | Resend |
| AI | Claude + Vulcano |
| Memory | Brain Relay `178.105.135.26:9000` |

---

## Infra

- Hetzner: `178.105.135.26`, PM2
- Brain secret: `superclaude2025`
- `GET /brain/boot2?secret=superclaude2025` → proyectos + patrones
- `POST /brain/exec?secret=superclaude2025` → bash en Hetzner

---

## Reglas para agentes

- Jimmy = Associate. NUNCA acceso al área V de Luis
- Clientes entran SOLO por invitación, sin registro público
- CMP = prioridad máxima ahora mismo
- 37 blog posts los escribe Luis — no generar automáticamente
- Tokens GitHub → vault Neon, NUNCA en env vars del frontend
- Negro genérico = error de diseño, corregir siempre a obsidian
