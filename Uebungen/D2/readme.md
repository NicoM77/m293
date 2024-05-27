# Erklärung des Grid-Aufbaus und seiner Funktionsweise

Das Grid-Layout wird im CSS mit der `.grid-container`-Klasse definiert, die das `display: grid`-Attribut nutzt. Hier sind die Details:

## Grid Container

```css
.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.5rem;
}
```

- `display: grid`: Aktiviert das Grid-Layout.
- `grid-template-columns: repeat(auto-fit, minmax(200px, 1fr))`: Erstellt automatisch so viele Spalten, wie in den verfügbaren Platz passen. Jede Spalte hat eine Mindestbreite von 200px und kann bis zu 1fr (ein Anteil der verfügbaren Breite) wachsen.
- `gap: 1.5rem`: Definiert den Abstand zwischen den Grid-Items (sowohl horizontal als auch vertikal).

## Grid Items

```css
.grid-item {
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 1rem;
    text-align: center;
}
```

Jedes Grid-Item hat:
- Einen Hintergrund (`background-color: #f9f9f9`).
- Einen Rand (`border: 1px solid #ddd`).
- Abgerundete Ecken (`border-radius: 8px`).
- Innenabstand (`padding: 1rem`).
- Zentrierten Text (`text-align: center`).

## Bild und Text innerhalb der Grid-Items

```css
.grid-item img {
    max-width: 100%;
    border-radius: 8px;
    margin-bottom: 1rem;
}
```

- `max-width: 100%`: Das Bild passt sich der Breite des Grid-Items an und wird nicht breiter als das Grid-Item.
- `border-radius: 8px`: Abgerundete Ecken für das Bild.
- `margin-bottom: 1rem`: Abstand zwischen dem Bild und dem folgenden Text.

Durch dieses Setup ist das Grid-Layout flexibel und passt sich an verschiedene Bildschirmgrößen an. Das `repeat(auto-fit, minmax(200px, 1fr))`-Attribut sorgt dafür, dass die Anzahl der Spalten dynamisch ist und den verfügbaren Platz optimal nutzt.