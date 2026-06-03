---
name: skill-eval
description: Registra resultados de ejecucion de skills en el Brain para aprendizaje continuo. ACTIVAR al terminar cualquier tarea — exitosa o fallida. Es la capa de evaluacion del sistema esferico. Sin eval no hay aprendizaje.
---
# Skill Eval — El loop de aprendizaje

## Proposito
Cada vez que una skill se ejecuta, el resultado se guarda.
El sistema aprende que funciona, que falla, que combinar.
Con el tiempo las skills se auto-mejoran basadas en evidencia real.

## Registrar una ejecucion

### Exito
POST http://178.105.135.26/brain/query
{
  "secret": "superclaude2025",
  "query": "INSERT INTO skill_runs (skill_name, project_id, agent, resultado, que_funciono, tokens_used, context) VALUES ($1,$2,$3,'success',$4,$5,$6)",
  "params": ["nombre-skill", "proyecto-id", "chat", "que salio bien", 1500, "contexto breve"]
}

### Fallo
{
  "params": ["nombre-skill", "proyecto-id", "chat", "fail", "que funciono", "que salio mal", null, "contexto"]
}
-- Usar: INSERT INTO skill_runs (skill_name, project_id, agent, resultado, que_funciono, que_salio_mal, tokens_used, context)

### Parcial
resultado = 'partial' — funciono pero con workaround

## Consultar aprendizaje acumulado

### Top skills mas exitosas
SELECT skill_name, COUNT(*) runs,
  ROUND(AVG(CASE WHEN resultado='success' THEN 1.0 ELSE 0 END)*100) success_pct
FROM skill_runs GROUP BY skill_name ORDER BY success_pct DESC

### Que falla mas
SELECT skill_name, que_salio_mal, COUNT(*) veces
FROM skill_runs WHERE resultado='fail'
GROUP BY skill_name, que_salio_mal ORDER BY veces DESC

### Combos exitosos
SELECT skill_a, skill_b, success_rate, veces_usada
FROM skill_combos ORDER BY success_rate DESC

### Insights del sistema
SELECT tipo, skill_name, insight FROM eval_insights
WHERE aplicado = FALSE ORDER BY created_at DESC

## Registrar combo (2 skills usadas juntas)
INSERT INTO skill_combos (skill_a, skill_b, proyecto, veces_usada, success_rate)
VALUES ('skill-a', 'skill-b', 'proyecto', 1, 1.0)
ON CONFLICT (skill_a, skill_b, proyecto)
DO UPDATE SET veces_usada = skill_combos.veces_usada + 1

## Mutar una skill (crear version experimental)
INSERT INTO skill_mutations (parent_skill, child_skill, descripcion, status)
VALUES ('skill-original', 'skill-v2-experimental', 'que cambia', 'experimental')

## Promover mutacion a estandar
UPDATE skill_mutations SET status='promoted', promoted_at=NOW()
WHERE child_skill = 'skill-v2-experimental'
-- Luego actualizar SKILL.md con la nueva version

## Cuando registrar
- AL TERMINAR cualquier tarea con una skill (exitosa o no)
- Cuando detectas que 2 skills se usan juntas
- Cuando una skill requirio workaround
- Cuando creas una variante experimental

## El objetivo
Con 100 runs acumulados el sistema sabe:
- Que skills son confiables
- En que proyectos funciona cada una
- Que combinaciones son poderosas
- Que patrones generan fallo

Con 1000 runs: el sistema se auto-sugiere mejoras.
Con 10000 runs: las skills se auto-reescriben.
