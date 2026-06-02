---
name: chat-to-code-bridge
description: Puente de comunicacion entre Claude Chat y Claude Code via Neon Brain dispatch_queue y Hetzner relay. ACTIVAR cuando el usuario diga "dile a Code", "manda a Code", "que Code haga", "escribe en la queue", "task para Code", o cuando este chat necesite enviar instrucciones a Claude Code sin que Luis copie/pegue nada.
---
# Chat-to-Code Bridge

## Como funciona
Claude Chat escribe tareas al dispatch_queue en Neon Brain. Claude Code las lee al hacer boot.
Si Claude Code no coopera, Claude Chat ejecuta directo via Hetzner relay.

## Escribir tarea para Claude Code
POST http://178.105.135.26/brain/query
Body: {"secret":"superclaude2025","query":"INSERT INTO dispatch_queue (source_agent,target_agent,project_id,command,payload) VALUES ($1,$2,$3,$4,$5)","params":["claude-chat","claude-code","proyecto","comando","{instrucciones JSON}"]}

## Ejecutar directo en Hetzner (bypass si Code no coopera)
POST http://178.105.135.26/brain/exec
Body: {"secret":"superclaude2025","cmd":"comando bash"}

## Leer status
GET http://178.105.135.26/brain/dispatch?secret=superclaude2025

## Regla
Intentar dispatch_queue primero. Si Code no ejecuta en tiempo razonable, usar relay directo.
