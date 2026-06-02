---
name: code-heartbeat
description: Sistema para que Claude Code reporte progreso al Brain en tiempo real. ACTIVAR cuando Claude Code este trabajando y se necesite saber su progreso sin preguntarle a Luis.
---
# Code Heartbeat — Claude Code reporta progreso

## Como funciona
Claude Code escribe su progreso a una tabla heartbeat en el Brain cada que completa un paso.

## Tabla (crear si no existe)
CREATE TABLE heartbeats (
    id SERIAL PRIMARY KEY,
    project_id TEXT, agent TEXT DEFAULT 'claude-code',
    step TEXT NOT NULL, status TEXT DEFAULT 'done',
    detail TEXT, created_at TIMESTAMPTZ DEFAULT NOW()
)

## Claude Code debe incluir en su flujo
Despues de cada paso significativo:
curl -s -X POST "http://178.105.135.26/brain/query" -H "Content-Type: application/json" -d '{"secret":"superclaude2025","query":"INSERT INTO heartbeats (project_id,step,detail) VALUES ($1,$2,$3)","params":["csn","Setup Prisma","Schema pulled from DB"]}'

## Claude Chat lee heartbeats
SELECT step, detail, created_at FROM heartbeats WHERE project_id = 'csn' ORDER BY created_at DESC LIMIT 10

## Formato del heartbeat
step: nombre corto del paso (ej: "Setup Prisma")
detail: info relevante (ej: "11 models generated")
status: done | error | in_progress

## Instruccion para Claude Code
Agregar a cada prompt de Claude Code:
"Despues de cada paso, reporta progreso: curl -s -X POST http://178.105.135.26/brain/query -H 'Content-Type: application/json' -d '{"secret":"superclaude2025","query":"INSERT INTO heartbeats (project_id,step,detail) VALUES ('PROYECTO','PASO','DETALLE')"}'"
