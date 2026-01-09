# 📥 Tasmota ESP32 S3 LVGL Firmware v15.0.1 - ERWEITERTE VERSION

## ✅ Neue Features in dieser Version!

### 🌡️ DS18X20 Sensor-Limit erhöht
- **Standard**: 8 Sensoren
- **NEU**: 10 Sensoren
- Unterstützt mehr DS18B20/DS18S20/DS1822 Temperatursensoren gleichzeitig

### 🔤 Roboto Font-Familie hinzugefügt
- **Roboto-Regular.ttf** (342 KB)
- **Roboto-Bold.ttf** (343 KB)
- **Roboto-Light.ttf** (342 KB)
- Professionelle Schriftarten für LVGL Displays
- Fonts müssen nach dem Flash manuell hochgeladen werden

### 🌐 WiFi voreingestellt
- **SSID**: miVida2
- **Passwort**: m1Curaz#n
- Automatische Verbindung nach dem Flash

---

## 📦 Download-Optionen

### Option 1: Einzelne Dateien (EMPFOHLEN)

**Im VSCode File Explorer (links):**
```
/workspaces/tasmocompiler/firmware_output/
```

**Rechtsklick auf Datei → "Download"**

### Wichtige Dateien:

| Datei | Größe | Verwendung |
|-------|-------|------------|
| **tasmota32s3.factory.bin** | 3.0 MB | ✅ Initial Flash (empfohlen) |
| **tasmota32s3.bin** | 2.1 MB | OTA Updates |
| **Roboto-Regular.ttf** | 342 KB | Font für LVGL |
| **Roboto-Bold.ttf** | 343 KB | Font für LVGL (fett) |
| **Roboto-Light.ttf** | 342 KB | Font für LVGL (leicht) |
| **README_FONTS.md** | 2 KB | Font-Anleitung |
| **DS18X20_ANLEITUNG.md** | 5 KB | Sensor-Anleitung |
| **CHANGELOG.txt** | 3 KB | Änderungen |

### Option 2: Komplettes Archiv

**Datei:** `/workspaces/tasmocompiler/tasmota32s3-lvgl-v15.0.1-extended.tar.gz` (3.9 MB)

Enthält alle Dateien inklusive Fonts und Dokumentation.

---

## 🔧 Installation

### Schritt 1: Firmware flashen

**Einfachste Methode - Web Flasher:**

1. Öffnen Sie: **https://web.esphome.io/**
2. ESP32 S3 via USB verbinden
3. "Connect" → USB-Port auswählen
4. "Install" → `tasmota32s3.factory.bin` auswählen
5. Warten (ca. 2-3 Minuten)

**Alternative: esptool.py**
```bash
pip install esptool

esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 460800 \
  write_flash -z 0x0 tasmota32s3.factory.bin
```

### Schritt 2: WiFi-Verbindung

Nach dem Flash verbindet sich das Gerät automatisch mit:
- **SSID**: miVida2
- **Passwort**: m1Curaz#n

**IP-Adresse finden:**
- Im Router nachsehen (Gerätename: tasmota-XXXXXX)
- Oder: http://tasmota.local (funktioniert nicht immer)

### Schritt 3: Fonts hochladen (optional)

1. Tasmota Web-Interface öffnen: `http://[IP-ADRESSE]`
2. **Consoles** → **Manage File system**
3. Fonts hochladen:
   - Roboto-Regular.ttf
   - Roboto-Bold.ttf (optional)
   - Roboto-Light.ttf (optional)

**Hinweis:** Filesystem hat 320 KB. Laden Sie nur benötigte Fonts hoch!

### Schritt 4: DS18X20 Sensoren konfigurieren (optional)

**Via Web-Interface:**
1. **Configuration** → **Configure Module**
2. GPIO auswählen (z.B. GPIO4)
3. Funktion: **DS18x20**
4. **Save**

**Via Console:**
```
GPIO4 DS18x20
```

Siehe **DS18X20_ANLEITUNG.md** für Details.

---

## 🎨 Fonts in LVGL verwenden

### Berry Script Beispiel:

```berry
import lvgl as lv

# Font laden (nach Upload ins Filesystem)
var roboto_regular = lv.freetype_font("Roboto-Regular.ttf", 24)
var roboto_bold = lv.freetype_font("Roboto-Bold.ttf", 32)

# Label mit Roboto erstellen
var label = lv.label(lv.scr_act())
label.set_text("Tasmota LVGL")
label.set_style_text_font(roboto_bold, lv.PART_MAIN | lv.STATE_DEFAULT)
label.align(lv.ALIGN_CENTER, 0, 0)
```

### Verschiedene Größen:

```berry
var roboto_16 = lv.freetype_font("Roboto-Regular.ttf", 16)
var roboto_20 = lv.freetype_font("Roboto-Regular.ttf", 20)
var roboto_24 = lv.freetype_font("Roboto-Regular.ttf", 24)
var roboto_32 = lv.freetype_font("Roboto-Regular.ttf", 32)
```

Siehe **README_FONTS.md** für mehr Beispiele.

---

## 🌡️ DS18X20 Sensoren verwenden

### Hardware-Aufbau:

```
ESP32 S3          DS18B20
--------          -------
GPIO 4 -----------+---- Data (gelb)
3.3V -------------+---- VDD (rot)
GND --------------+---- GND (schwarz)
                  |
                 4.7kΩ Pullup
                 (zwischen Data und VDD)
```

### Mehrere Sensoren (bis zu 10):

Alle Sensoren parallel am gleichen GPIO anschließen.
Nur **ein** Pullup-Widerstand für alle Sensoren!

### Sensoren benennen:

```
DS18Alias1 Wohnzimmer
DS18Alias2 Schlafzimmer
DS18Alias3 Küche
DS18Alias4 Bad
DS18Alias5 Keller
DS18Alias6 Garage
DS18Alias7 Außen
DS18Alias8 Heizung
DS18Alias9 Warmwasser
DS18Alias10 Solar
```

Siehe **DS18X20_ANLEITUNG.md** für Details.

---

## 📋 Checksummen (MD5)

```
1be15f06f2554f7fd1e9c4476e021fe6  tasmota32s3.bin
e49233e14030efa7df41857a3357cc6b  tasmota32s3.factory.bin
```

**Überprüfen:**
```bash
md5sum tasmota32s3.factory.bin
```

---

## ⚠️ Wichtige Hinweise

### Filesystem-Größe
- **320 KB** LittleFS Partition
- Alle drei Fonts = ca. 1 MB
- **Empfehlung**: Nur benötigte Fonts hochladen
- Roboto-Regular.ttf reicht für die meisten Anwendungen

### DS18X20 Sensoren
- Bis zu **10 Sensoren** gleichzeitig
- Pullup-Widerstand erforderlich (4.7kΩ)
- Kurze Kabel verwenden (< 10m)
- Bei langen Kabeln: 2.2kΩ Pullup

### Font-Speicher
- Jeder geladene Font verbraucht RAM
- Nur benötigte Größen laden
- Beispiel: Roboto-Regular in 16, 20, 24 Pixel

---

## 🎯 Vollständiges Beispiel: Temperatur-Display

```berry
import lvgl as lv

# Font laden
var font_big = lv.freetype_font("Roboto-Bold.ttf", 48)
var font_small = lv.freetype_font("Roboto-Regular.ttf", 20)

# Temperatur-Label
var temp_label = lv.label(lv.scr_act())
temp_label.set_style_text_font(font_big, lv.PART_MAIN | lv.STATE_DEFAULT)
temp_label.set_style_text_color(lv.color(0xFF0000), lv.PART_MAIN | lv.STATE_DEFAULT)
temp_label.align(lv.ALIGN_CENTER, 0, -20)

# Sensor-Name Label
var name_label = lv.label(lv.scr_act())
name_label.set_style_text_font(font_small, lv.PART_MAIN | lv.STATE_DEFAULT)
name_label.set_text("Wohnzimmer")
name_label.align(lv.ALIGN_CENTER, 0, 40)

# Temperatur aktualisieren (alle 10 Sekunden)
def update_temp()
  var sensors = tasmota.read_sensors()
  if sensors.contains("DS18B20-1")
    var temp = sensors["DS18B20-1"]["Temperature"]
    temp_label.set_text(string.format("%.1f°C", temp))
  end
end

tasmota.add_cron("*/10 * * * * *", update_temp, "update_temp")
update_temp()
```

---

## 📚 Dokumentation

### In diesem Paket:
- **README_FONTS.md** - Font-Verwendung in LVGL
- **DS18X20_ANLEITUNG.md** - Sensor-Konfiguration
- **CHANGELOG.txt** - Änderungen in dieser Version

### Online:
- **Tasmota Docs**: https://tasmota.github.io/docs/
- **LVGL Docs**: https://tasmota.github.io/docs/LVGL/
- **Berry Docs**: https://tasmota.github.io/docs/Berry/
- **DS18x20 Docs**: https://tasmota.github.io/docs/DS18x20/

---

## 🚀 Nächste Schritte

1. ✅ Firmware flashen
2. ✅ Mit WiFi "miVida2" verbinden (automatisch)
3. ✅ IP-Adresse finden
4. ✅ Tasmota Web-Interface öffnen
5. 🎨 Fonts hochladen (optional)
6. 🌡️ DS18X20 Sensoren anschließen (optional)
7. 📱 Display mit LVGL konfigurieren
8. 🎯 Berry Scripts erstellen

---

**Build-Informationen:**
- Version: Tasmota v15.0.1
- Board: ESP32 S3
- Build-Datum: 2026-01-09
- Compiler: TasmoCompiler (Gitpod)

**Neue Features:**
- ✅ DS18X20: 10 Sensoren (statt 8)
- ✅ Roboto Fonts: Regular, Bold, Light
- ✅ WiFi: miVida2 voreingestellt

Viel Erfolg! 🚀
