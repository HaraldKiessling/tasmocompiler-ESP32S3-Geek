# Display-Konfiguration für Tasmota-77

## Übersicht

Das Display-System basiert auf **HASPmota** (Home Automation Smart Panel) und verwendet **LVGL** (Light and Versatile Graphics Library) für die Darstellung. Die Konfiguration erfolgt über zwei Dateien:

1. **autoexec.be** - Berry-Skript für Logik und Daten-Updates
2. **pages.jsonl** - JSON Lines Format für Layout-Definition

## autoexec.be - Display-Logik

### Struktur

```berry
import haspmota
import json
import string

# HASPmota Engine starten
haspmota.start()

# Treiber-Klasse für zyklische Updates
class SensorDashboard : Driver
    var network_counter
    
    def init()
        self.network_counter = 0
    end
    
    def every_second()
        # Sensor-Updates jede Sekunde
    end
    
    def every_100ms()
        # Uhrzeit-Updates alle 100ms
    end
end

# Treiber registrieren
tasmota.add_driver(SensorDashboard())
```

### Sensor-Daten auslesen

```berry
# JSON-Daten von Tasmota lesen
var raw_json = tasmota.read_sensors()
var m = json.load(raw_json)

# DS18B20 Sensor auslesen
if m.contains('DS18B20-1')
    var sensor = m['DS18B20-1']
    if sensor.contains('Temperature')
        var temp = sensor['Temperature']
        global.p1b20.text = string.format("Sensor 1: %.1f°C", temp)
    end
end

# BME280 Sensor auslesen
if m.contains('BME280')
    var bme = m['BME280']
    if bme.contains('Temperature')
        var temp = bme['Temperature']
        global.p1b16.text = string.format("%.1f°C", temp)
    end
end
```

### Netzwerk-Informationen

```berry
# IP-Adresse (alle 60 Sekunden)
var status5 = tasmota.cmd("Status 5", true)
if status5 != nil && status5.contains("StatusNET")
    var net = status5["StatusNET"]
    if net.contains("IPAddress")
        global.p1b12.text = net["IPAddress"]
    end
end

# WiFi SSID
var status11 = tasmota.cmd("Status 11", true)
if status11 != nil && status11.contains("StatusSTS")
    var sts = status11["StatusSTS"]
    if sts.contains("Wifi") && sts["Wifi"].contains("SSId")
        global.p1b13.text = sts["Wifi"]["SSId"]
    end
end
```

### Uhrzeit und Datum

```berry
def every_100ms()
    if global.p1b14 != nil
        var now = tasmota.rtc()
        var time_str = tasmota.strftime("%H:%M:%S", now['local'])
        global.p1b14.text = time_str
    end
    
    if global.p1b15 != nil
        var now = tasmota.rtc()
        var date_str = tasmota.strftime("%d.%m.%Y", now['local'])
        global.p1b15.text = date_str
    end
end
```

### Performance-Optimierung

```berry
# Logging reduzieren
import global
global.log_level = 2  # Nur Warnungen und Fehler

# Netzwerk-Updates nur alle 60 Sekunden
self.network_counter += 1
if self.network_counter >= 60
    self.network_counter = 0
    # Update IP und SSID
end

# Fehlerbehandlung
if raw_json == nil return end
if m == nil return end
if global.p1b20 == nil return end
```

## pages.jsonl - Layout-Definition

### Format

Jede Zeile ist ein JSON-Objekt, das ein Display-Element definiert:

```json
{"page":1,"id":1,"obj":"obj","x":0,"y":0,"w":320,"h":240,"bg_color":"#000000"}
{"page":1,"id":12,"obj":"label","x":10,"y":10,"w":150,"h":20,"text":"IP: --","text_font":16}
```

### Seiten-Objekt

```json
{
  "page": 1,           // Seiten-Nummer
  "id": 1,             // Objekt-ID (eindeutig pro Seite)
  "obj": "obj",        // Objekt-Typ: Seiten-Container
  "x": 0,              // X-Position
  "y": 0,              // Y-Position
  "w": 320,            // Breite
  "h": 240,            // Höhe
  "bg_color": "#000000" // Hintergrundfarbe (Schwarz)
}
```

### Label-Objekt

```json
{
  "page": 1,              // Seiten-Nummer
  "id": 20,               // Objekt-ID
  "obj": "label",         // Objekt-Typ: Text-Label
  "x": 10,                // X-Position (Pixel)
  "y": 150,               // Y-Position (Pixel)
  "w": 300,               // Breite (Pixel)
  "h": 20,                // Höhe (Pixel)
  "text": "Sensor 1: --", // Initial-Text
  "text_font": 16,        // Schriftgröße
  "text_color": "#FFFFFF", // Textfarbe (Weiß)
  "align": "left"         // Ausrichtung: left, center, right
}
```

### Verfügbare Objekt-Typen

| Typ | Beschreibung | Verwendung |
|-----|--------------|------------|
| `obj` | Container | Seiten-Hintergrund |
| `label` | Text-Label | Texte, Sensor-Werte |
| `btn` | Button | Interaktive Schaltflächen |
| `switch` | Schalter | Toggle-Buttons |
| `checkbox` | Checkbox | An/Aus-Auswahl |
| `slider` | Schieberegler | Wert-Einstellung |
| `arc` | Bogen | Runde Anzeigen |
| `line` | Linie | Trennlinien |
| `img` | Bild | Icons, Grafiken |

### Schriftgrößen

```json
"text_font": 12  // Klein
"text_font": 16  // Normal
"text_font": 20  // Mittel
"text_font": 24  // Groß
"text_font": 28  // Sehr groß
"text_font": 32  // Extra groß
```

### Farben

```json
"text_color": "#FFFFFF"   // Weiß
"text_color": "#000000"   // Schwarz
"text_color": "#FF0000"   // Rot
"text_color": "#00FF00"   // Grün
"text_color": "#0000FF"   // Blau
"text_color": "#FFFF00"   // Gelb
"text_color": "#FF00FF"   // Magenta
"text_color": "#00FFFF"   // Cyan
"text_color": "#808080"   // Grau
```

### Ausrichtung

```json
"align": "left"    // Linksbündig
"align": "center"  // Zentriert
"align": "right"   // Rechtsbündig
```

## Label-IDs für Tasmota-77

### Header (Seite 1)

| ID | Label | Beschreibung | Update |
|----|-------|--------------|--------|
| p1b12 | IP-Adresse | z.B. 192.168.0.77 | 60s |
| p1b13 | WiFi SSID | Aktuelles WLAN | 60s |
| p1b14 | Uhrzeit | 08:15:30 | 100ms |
| p1b15 | Datum | 10.01.2026 | 100ms |

### BME280 Sensor

| ID | Label | Beschreibung | Update |
|----|-------|--------------|--------|
| p1b16 | Temperatur | 21.5°C | 1s |
| p1b17 | Luftfeuchtigkeit | 45.2% | 1s |
| p1b18 | Luftdruck | 1013.2 hPa | 1s |

### DS18B20 Sensoren

| ID | Label | Beschreibung | Update |
|----|-------|--------------|--------|
| p1b20 | Sensor 1 | DS18B20-1: 21.9°C | 1s |
| p1b21 | Sensor 2 | DS18B20-2: 22.1°C | 1s |
| p1b22 | Sensor 3 | DS18B20-3: --°C | 1s |
| p1b23 | Sensor 4 | DS18B20-4: --°C | 1s |
| p1b24 | Sensor 5 | DS18B20-5: --°C | 1s |
| p1b25 | Sensor 6 | DS18B20-6: --°C | 1s |
| p1b26 | Sensor 7 | DS18B20-7: --°C | 1s |
| p1b27 | Sensor 8 | DS18B20-8: --°C | 1s |
| p1b28 | Sensor 9 | DS18B20-9: --°C | 1s |
| p1b29 | Sensor 10 | DS18B20-10: --°C | 1s |

## Custom Parameter

### Display-Größe anpassen

Für andere Display-Größen müssen die Koordinaten angepasst werden:

**320x240 (Standard):**
```json
{"page":1,"id":1,"obj":"obj","x":0,"y":0,"w":320,"h":240}
```

**480x320:**
```json
{"page":1,"id":1,"obj":"obj","x":0,"y":0,"w":480,"h":320}
```

### Zusätzliche Sensoren

Um weitere Sensoren hinzuzufügen:

**1. In autoexec.be:**
```berry
# DS18B20-11 hinzufügen
if m.contains('DS18B20-11') && ds_count < 11
    var sensor = m['DS18B20-11']
    if sensor.contains('Temperature')
        var temp = sensor['Temperature']
        global.p1b30.text = string.format("Sensor 11: %.1f°C", temp)
        ds_count += 1
    end
end
```

**2. In pages.jsonl:**
```json
{"page":1,"id":30,"obj":"label","x":10,"y":370,"w":300,"h":20,"text":"Sensor 11: --","text_font":16}
```

### Andere Sensoren integrieren

**DHT22 (Temperatur + Luftfeuchtigkeit):**
```berry
if m.contains('DHT22')
    var dht = m['DHT22']
    if dht.contains('Temperature')
        global.p1b40.text = string.format("DHT: %.1f°C", dht['Temperature'])
    end
    if dht.contains('Humidity')
        global.p1b41.text = string.format("Hum: %.1f%%", dht['Humidity'])
    end
end
```

**BH1750 (Lichtsensor):**
```berry
if m.contains('BH1750')
    var light = m['BH1750']
    if light.contains('Illuminance')
        global.p1b42.text = string.format("Licht: %d lx", light['Illuminance'])
    end
end
```

### Themes und Styles

**Dunkles Theme:**
```json
{"page":1,"id":1,"obj":"obj","bg_color":"#000000"}
{"page":1,"id":12,"obj":"label","text_color":"#FFFFFF","bg_color":"#000000"}
```

**Helles Theme:**
```json
{"page":1,"id":1,"obj":"obj","bg_color":"#FFFFFF"}
{"page":1,"id":12,"obj":"label","text_color":"#000000","bg_color":"#FFFFFF"}
```

**Farbige Akzente:**
```json
{"page":1,"id":16,"obj":"label","text_color":"#FF6600","text":"Temperatur"}
{"page":1,"id":17,"obj":"label","text_color":"#0099FF","text":"Luftfeuchtigkeit"}
{"page":1,"id":18,"obj":"label","text_color":"#00CC66","text":"Luftdruck"}
```

### Interaktive Elemente

**Button mit Aktion:**
```json
{"page":1,"id":50,"obj":"btn","x":10,"y":200,"w":100,"h":40,"text":"Restart"}
```

**In autoexec.be:**
```berry
# Button-Event Handler
def button_pressed(obj, event)
    if event == haspmota.EVENT_PRESSED
        if obj.id == 50
            tasmota.cmd("Restart 1")
        end
    end
end

# Event registrieren
global.p1b50.add_event_cb(button_pressed)
```

## Erweiterte Konfiguration

### Multi-Page Layout

**Seite 1: Sensoren**
```json
{"page":1,"id":1,"obj":"obj","x":0,"y":0,"w":320,"h":240,"bg_color":"#000000"}
```

**Seite 2: Einstellungen**
```json
{"page":2,"id":1,"obj":"obj","x":0,"y":0,"w":320,"h":240,"bg_color":"#001122"}
```

**Seiten-Wechsel:**
```berry
# In autoexec.be
def switch_page(page_num)
    haspmota.page_show(page_num)
end

# Button für Seite 2
global.p1b60.add_event_cb(def(obj, event)
    if event == haspmota.EVENT_PRESSED
        switch_page(2)
    end
end)
```

### Animationen

```json
{
  "page": 1,
  "id": 70,
  "obj": "label",
  "x": 10,
  "y": 100,
  "text": "Animiert",
  "anim_time": 500,
  "anim_speed": 100
}
```

### Grafiken und Icons

```json
{
  "page": 1,
  "id": 80,
  "obj": "img",
  "x": 10,
  "y": 10,
  "src": "A:/icon_temp.png"
}
```

**Icons hochladen:**
```bash
curl -F "file=@icon_temp.png" http://192.168.0.77/u2
```

## Debugging

### Berry Console

Web-Interface → Consoles → Berry Scripting

**Sensor-Daten prüfen:**
```berry
var raw = tasmota.read_sensors()
print(raw)
```

**Label-Wert prüfen:**
```berry
print(global.p1b20.text)
```

**Alle globalen Objekte:**
```berry
import global
print(global)
```

### Log-Level

```berry
# In autoexec.be
import global
global.log_level = 3  # 0=None, 1=Error, 2=Warning, 3=Info, 4=Debug
```

### Fehlerbehandlung

```berry
try
    var m = json.load(raw_json)
    # Verarbeitung
except .. as e, m
    print("JSON Error:", e, m)
end
```

## Best Practices

1. **Performance**
   - Netzwerk-Updates nur alle 60 Sekunden
   - Sensor-Updates jede Sekunde
   - Uhrzeit alle 100ms
   - Fehlerbehandlung für fehlende Sensoren

2. **Lesbarkeit**
   - Konsistente Schriftgrößen
   - Ausreichend Abstand zwischen Elementen
   - Kontrastreiche Farben

3. **Wartbarkeit**
   - Kommentare im Code
   - Logische Label-IDs (p1b20-p1b29 für DS18B20)
   - Modulare Struktur

4. **Fehlertoleranz**
   - Prüfung auf nil-Werte
   - Fallback-Texte ("--")
   - Try-Catch für kritische Bereiche

## Ressourcen

- **HASPmota Dokumentation**: https://tasmota.github.io/docs/HASPmota/
- **LVGL Dokumentation**: https://docs.lvgl.io/
- **Berry Language**: https://berry-lang.github.io/
- **Tasmota Berry**: https://tasmota.github.io/docs/Berry/
