---
name: coloquial-clone
description: Clonar el tono, voz y estilo de comunicación de una persona, marca o app para replicarlo en copy, prompts, chatbots, notificaciones o scripts. ACTIVAR cuando el usuario diga "suena como", "habla como", "mismo tono que", "copia el estilo de", "clona la voz de", "que suene coloquial", "tono mexicano", "imita a", "replica el copy de", "manejo coloquial".
---

# Coloquial Clone — Clona cualquier voz o tono

Replica el estilo de comunicación de personas, marcas o apps con precisión para copy, prompts y chatbots.

## Cuándo usar
- Copy que suene como figura pública o marca conocida
- Mantener coherencia de tono en campañas multicanal
- Prompts de IA que reflejen estilo de un creador
- Notificaciones o soporte con tono cercano y coloquial
- Chatbots con personalidad definida (tono mexicano, LATAM, etc.)

## Reglas
- No copiar texto literal — replicar patrones, no contenido
- Ajustar intensidad por canal (más informal en redes, más formal en email corporativo)
- Documentar parámetros: vocabulario, formalidad, humor, emojis
- Avisar cuando el estilo puede ser ofensivo o mal interpretado fuera del contexto cultural

## Pasos
1. Recolectar muestras — mínimo 10 ejemplos del tono objetivo (tweets, copy, emails)
2. Analizar patrones — vocabulario recurrente, emojis, longitud de frases, estructura
3. Crear guía de estilo — palabras clave, nivel de formalidad, tipo de humor
4. Construir prompt base — instrucción clara para Claude con los parámetros identificados
5. Generar 3 variantes de prueba
6. Comparar con ejemplos originales y ajustar prompt ("más coloquial", "menos jerga")
7. Validar con stakeholder o cliente
8. Guardar prompt final en prompts/coloq-clone/ del repo

## Errores conocidos
| Error | Causa | Fix |
|---|---|---|
| Sobre-personalización | Copiar frases literales | Usar patrones, no texto original |
| Demasiado slang | Exceso de jerga | Ajustar parámetro de intensidad |
| Emojis fuera de lugar | Falta de guía | Definir lista permitida por canal |
| Modismos no entendidos fuera de MX | Falta de adaptación regional | Especificar target geográfico |
| Prompt demasiado largo | Modelo pierde foco | Mantener prompt breve y directo |

## Ejemplo
Input: "Quiero que las notificaciones de Ruta618 suenen como Luis hablando en voz de texto"
Output: guía de estilo (vocab, emojis, frases tipo), prompt para Claude, 3 ejemplos de notificaciones generadas
