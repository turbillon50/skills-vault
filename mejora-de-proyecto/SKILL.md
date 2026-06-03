---
name: mejora-de-proyecto
description: Evaluar un proyecto existente, detectar gaps, priorizar mejoras y generar plan de accion. ACTIVAR cuando un proyecto ya funciona pero necesita crecer, cuando hay bugs recurrentes, cuando el cliente pide mejoras, o cuando el proyecto lleva tiempo sin actualizarse.
---
# Mejora de Proyecto

## Proceso de evaluacion (ejecutar en orden)

### 1. Audit tecnico
Verificar que todo sigue funcionando:
- curl -s https://DOMINIO/api/health → debe responder status:ok
- Ver ultimos deploys en Vercel (errores de build?)
- Revisar logs de Neon (queries lentas, errores conexion)
- Verificar webhooks activos en Clerk y Resend

### 2. Audit de infraestructura
- DNS resuelve correctamente? (dig A DOMINIO +short)
- Env vars completas en Vercel?
- Certificado SSL vigente?
- Dominio asignado al proyecto correcto en Vercel?

### 3. Audit de codigo (con Graphify)
cd /tmp/REPO && graphify update .
cat graphify-out/GRAPH_REPORT.md
- Hay "god nodes" (archivos con demasiadas dependencias)?
- Hay codigo huerfano (sin conexiones)?
- Que modulos tienen mas errores historicos?

### 4. Audit de UX
- Tomar screenshots de las pantallas principales
- Comparar con el diseno original de Stitch
- Identificar: animaciones faltantes, componentes inconsistentes
- Verificar dark mode, responsive en 320px y 1280px

### 5. Audit de negocio
- Que metricas importan al cliente?
- El admin panel muestra lo que el cliente necesita ver?
- Hay features prometidas en el contrato que faltan?

## Prioridades de mejora

### CRITICO (hace el proyecto no funcionar)
- Webhooks caidos
- Auth rota
- Pagos fallando
- Build con errores

### ALTO (afecta experiencia del usuario)
- Paginas lentas (> 3s en mobile)
- Formularios sin validacion
- Emails no llegan
- Mapas no cargan

### MEDIO (mejora la calidad)
- Animaciones faltantes (agregar framer-motion)
- Componentes inconsistentes (aplicar design-system)
- Admin panel incompleto (aplicar superadmin skill)
- Dark mode parcial

### BAJO (nice to have)
- SEO mejorable
- Lighthouse < 90
- Accesibilidad WCAG

## Prompt para Claude Code (mejora rapida)
```
Revisa el proyecto [NOMBRE] en el repo [REPO].

Prioridad 1 — CRITICO: [lista de issues criticos]
Prioridad 2 — ALTO: [lista de issues altos]
Prioridad 3 — MEDIO: [lista de mejoras]

Para cada fix:
1. Describe el problema exacto
2. Muestra el codigo actual vs el corregido
3. No rompas funcionalidad existente
4. Usa los componentes del design-system (skills-vault/user/design-system)
5. Agrega animaciones con framer-motion donde falten

Al terminar: git commit "fix: [descripcion]" y push.
```

## Skill combos que funcionan para mejoras
- mejora-de-proyecto + graphify-setup → detectar deuda tecnica
- mejora-de-proyecto + framer-motion → agregar animaciones faltantes
- mejora-de-proyecto + design-system → estandarizar UI
- mejora-de-proyecto + superadmin → completar panel admin
- mejora-de-proyecto + skill-eval → registrar que funciono

## Ciclo de mejora continua
```
audit → detectar → priorizar → prompt → fix → verificar → eval
  ^___________________________________________________|
```
Registrar resultado en skill_runs al terminar.
