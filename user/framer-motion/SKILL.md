# Framer Motion Skill

**Trigger:** Animaciones, transiciones, gestos, scroll effects, micro-interactions en React/Next.js

## Descripción
Implementación estándar de Framer Motion en proyectos frontend Luis Delator. Patrones pre-optimizados para performance, mobile-first, y reproducción fiel de diseños con animaciones.

## Triggers
- "anima esto", "agrega animación", "scroll animation", "gesture", "page transition"
- "micro-interactions", "loading state animado", "reveal animation"
- Cualquier UI que necesite movimiento fluido y pulido

## Stack Estándar
```
npm install framer-motion
```

## Patterns Principales
1. Scroll-Triggered Animations
2. Gesture Animations (Hover, Tap, Drag)
3. Layout Animations (Reorder, Resize)
4. Page Transitions (Next.js)
5. Loading States

## Performance
- Usar transform + opacity (GPU-accelerated)
- Limitar animaciones simultáneas a <5
- Test en mobile
- will-change: transform en elementos animados

## Integración Proyectos
- Castores: Product animations, cart reveal
- Crede-ti: Panel transitions, chart animations  
- Ruta 618: Scroll animations, status transitions
- V-Gift: Reveal animations, effects
- Demos: Fade-in, stagger animations

## Resources
- Docs: https://www.framer.com/motion/
- Performance: https://www.framer.com/motion/guide-optimize
