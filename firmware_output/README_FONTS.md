# Roboto Fonts für Tasmota LVGL

Diese Fonts werden in das Filesystem des ESP32 hochgeladen und können dann in LVGL verwendet werden.

## Verfügbare Fonts:
- Roboto-Regular.ttf (342 KB)
- Roboto-Bold.ttf (343 KB)
- Roboto-Light.ttf (342 KB)

## Installation:

### 1. Fonts hochladen
Nach dem Flashen der Firmware:
1. Tasmota Web-Interface öffnen
2. Consoles → Manage File system
3. Fonts hochladen in das Root-Verzeichnis

### 2. Fonts in Berry verwenden

```berry
# Font laden
var roboto_regular = lv.freetype_font("Roboto-Regular.ttf", 20)
var roboto_bold = lv.freetype_font("Roboto-Bold.ttf", 24)
var roboto_light = lv.freetype_font("Roboto-Light.ttf", 16)

# Font verwenden
var label = lv.label(lv.scr_act())
label.set_text("Hello World")
label.set_style_text_font(roboto_regular, lv.PART_MAIN | lv.STATE_DEFAULT)
```

### 3. Verschiedene Größen

```berry
# Verschiedene Größen des gleichen Fonts
var roboto_16 = lv.freetype_font("Roboto-Regular.ttf", 16)
var roboto_20 = lv.freetype_font("Roboto-Regular.ttf", 20)
var roboto_24 = lv.freetype_font("Roboto-Regular.ttf", 24)
var roboto_32 = lv.freetype_font("Roboto-Regular.ttf", 32)
```

## Beispiel: Vollständiges Label mit Roboto

```berry
import lvgl as lv

# Font laden
var my_font = lv.freetype_font("Roboto-Bold.ttf", 28)

# Label erstellen
var label = lv.label(lv.scr_act())
label.set_text("Tasmota LVGL")
label.set_style_text_font(my_font, lv.PART_MAIN | lv.STATE_DEFAULT)
label.set_style_text_color(lv.color(0x0000FF), lv.PART_MAIN | lv.STATE_DEFAULT)
label.align(lv.ALIGN_CENTER, 0, 0)
```

## Speicherverbrauch

Jeder geladene Font verbraucht RAM. Verwenden Sie nur die Größen, die Sie wirklich benötigen.

## Weitere Informationen

- Tasmota LVGL Dokumentation: https://tasmota.github.io/docs/LVGL/
- Berry Scripting: https://tasmota.github.io/docs/Berry/
