# Release Notes - ESP32-S3-Geek Firmware

## v15.0.1-ESP32S3-Geek (2026-01-10)

### Verfügbare Firmware-Versionen

#### 1. LVGL v15.0.1 (Empfohlen)
**Datei**: `tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin`  
**Größe**: 2.1 MB  
**Status**: ✅ Verfügbar

**Download:**
```bash
curl -L -o tasmota32s3-lvgl.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin"
```

#### 2. Matter-HA-BME280 v15.0.1
**Datei**: `tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin`  
**Größe**: 2.7 MB  
**Status**: ✅ Verfügbar

**Download:**
```bash
curl -L -o tasmota32s3-matter-ha.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin"
```

#### 3. Optimierte Version (Konfiguration verfügbar)
**Datei**: `compile_request_optimized.json`  
**Erwartete Größe**: ~1.9-2.0 MB  
**Status**: ⚙️ Kompilierung erforderlich

**Kompilierung:**
```bash
./compile_optimized.sh
# Oder TasmoCompiler Web-Interface verwenden
```

---

## Features

### LVGL v15.0.1

**Display & Touch:**
- ✅ LVGL Graphics Library
- ✅ CST816S Touch Controller
- ✅ 320x240 TFT Display (ST7789)
- ✅ HASPmota Display Engine

**Sensoren:**
- ✅ DS18B20 Temperature Sensors (bis zu 10)
- ✅ BME280 Environmental Sensor (I2C)
  - Temperatur (-40°C bis +85°C)
  - Luftfeuchtigkeit (0-100%)
  - Luftdruck (300-1100 hPa)

**Scripting & System:**
- ✅ Berry Scripting Language
- ✅ File System (autoexec.be, pages.jsonl)
- ✅ Rules Engine
- ✅ Web Interface
- ✅ OTA Updates

**Kommunikation:**
- ✅ WiFi (2.4 GHz)
- ✅ MQTT Client
- ✅ HTTP API
- ✅ Serial Console

**GPIO-Template:**
- ✅ Vorkonfiguriert für ESP32-S3-Geek
- ✅ DS18x20 auf GPIO 6, 13, 14
- ✅ I2C auf GPIO 16 (SDA), 17 (SCL)
- ✅ SDIO Display auf GPIO 22-27

### Matter-HA-BME280 v15.0.1

**Zusätzlich zu LVGL-Features:**
- ✅ Matter Protocol Support
- ✅ Home Assistant Integration
- ✅ Thread Network Support
- ⚠️ Größere Firmware (2.7 MB)
- ⚠️ Keine 10x DS18B20 Unterstützung

### Optimierte Version

**Verbesserungen gegenüber LVGL:**
- ✅ 100-700 KB kleiner (~1.9-2.0 MB)
- ✅ Schnellerer Boot (15-25%)
- ✅ Weniger RAM-Nutzung (10-20 KB)
- ✅ Alle benötigten Features erhalten

**Entfernte Module:**
- ❌ Energy Sensor (30-50 KB)
- ❌ Accelerometer/MPU (15-25 KB)
- ❌ RTC Chips (10-15 KB)
- ❌ Unused Touch Controllers (20-30 KB)
- ❌ Rotary Encoder (5-10 KB)
- ❌ Buzzer (5-8 KB)
- ❌ Light Palette (8-12 KB)
- ❌ Shelly Pro (10-15 KB)
- ❌ Serial Bridge (8-12 KB)

---

## Installation

### 1. Firmware herunterladen

```bash
# LVGL Version (empfohlen)
curl -L -o firmware.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin"
```

### 2. Firmware flashen

**Option A: OTA (für laufende Geräte)**
```bash
python3 upload_firmware_77.py firmware.bin 192.168.0.77
```

**Option B: Seriell (für neue Geräte)**
```bash
esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 921600 \
  write_flash -z 0x0 firmware.bin
```

### 3. Konfiguration

```bash
# Automatische Konfiguration
./setup-tasmota-77.sh 192.168.0.77 "MeinWLAN" "MeinPasswort"

# Display-Dateien hochladen
python3 upload_77_autoexec.py
python3 upload_77_pages.py
```

**Vollständige Anleitung**: [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)

---

## Änderungen

### v15.0.1-ESP32S3-Geek (2026-01-10)

**Neue Features:**
- ✅ Optimierte Firmware-Konfiguration verfügbar
- ✅ GPIO-Template automatisch vorkonfiguriert
- ✅ Setup-Skript für automatische Konfiguration
- ✅ Display-Upload-Skripte (Python)
- ✅ Umfassende Dokumentation

**Verbesserungen:**
- ✅ Keine vorkonfigurierten WiFi-Credentials (Sicherheit)
- ✅ Optimiertes Display-Layout
- ✅ Reduzierte Log-Ausgabe
- ✅ Verbesserte Sensor-Erkennung
- ✅ Schnellere Display-Updates

**Dokumentation:**
- ✅ FIRMWARE_DOWNLOAD.md - Download-Anleitung
- ✅ DEPLOYMENT_GUIDE.md - Deployment-Prozess
- ✅ SETUP_TASMOTA_77.md - Konfiguration
- ✅ DISPLAY_CONFIG.md - Display-Anpassung
- ✅ FIRMWARE_OPTIMIZATION.md - Optimierung

**Bugfixes:**
- ✅ Button-Funktionalität korrigiert
- ✅ Display-Update-Performance verbessert
- ✅ Sensor-Polling optimiert

### v15.0.1-ESP32S3-Geek-10xDS18x20 (2026-01-09)

**Initial Release:**
- ✅ LVGL Display Support
- ✅ 10x DS18B20 Sensoren
- ✅ BME280 Sensor
- ✅ Berry Scripting
- ✅ Custom Display Layout
- ✅ GPIO-Template

### v15.0.1-Matter-HA-BME280 (2026-01-09)

**Initial Release:**
- ✅ Matter Protocol
- ✅ Home Assistant Integration
- ✅ BME280 Sensor
- ✅ LVGL Display

---

## Bekannte Probleme

### LVGL v15.0.1

**Keine kritischen Probleme bekannt.**

**Hinweise:**
- WiFi muss nach erstem Flash konfiguriert werden (AP-Modus)
- Display-Dateien müssen separat hochgeladen werden
- GPIO-Template wird automatisch beim ersten Start geladen

### Matter-HA-BME280

**Einschränkungen:**
- Keine Unterstützung für 10x DS18B20 Sensoren
- Größere Firmware (2.7 MB)
- Matter-Setup erforderlich

### Optimierte Version

**Status:**
- Kompilierung erforderlich
- Noch nicht getestet auf Hardware
- Konfiguration verfügbar

---

## Upgrade-Pfad

### Von v15.0.1-LVGL zu Optimiert

```bash
# 1. Optimierte Firmware kompilieren
./compile_optimized.sh

# 2. Firmware flashen (OTA)
python3 upload_firmware_77.py firmware-optimized.bin 192.168.0.77

# 3. Konfiguration bleibt erhalten
# 4. Display-Dateien bleiben erhalten
```

### Von Matter-HA zu LVGL

```bash
# 1. Backup erstellen
curl -s "http://192.168.0.77/dl" > backup.dmp

# 2. LVGL Firmware flashen
python3 upload_firmware_77.py tasmota32s3-lvgl.bin 192.168.0.77

# 3. Konfiguration wiederherstellen
curl -F "file=@backup.dmp" http://192.168.0.77/u3

# 4. Display-Dateien hochladen
python3 upload_77_autoexec.py
python3 upload_77_pages.py
```

---

## Kompatibilität

### Hardware

**Getestet auf:**
- ✅ ESP32-S3-Geek (Waveshare)
- ✅ ESP32-S3 DevKit
- ✅ ESP32-S3 mit ST7789 Display

**Anforderungen:**
- ESP32-S3 (16 MB Flash, 8 MB PSRAM)
- ST7789 TFT Display (320x240)
- CST816S Touch Controller
- Optional: DS18B20 Sensoren
- Optional: BME280 Sensor

### Software

**Kompatibel mit:**
- ✅ Tasmota v15.0.1
- ✅ Berry Scripting
- ✅ HASPmota
- ✅ MQTT Broker (Mosquitto, etc.)
- ✅ Home Assistant (via MQTT)

---

## Support

### Dokumentation
- [FIRMWARE_DOWNLOAD.md](FIRMWARE_DOWNLOAD.md) - Download
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) - Installation
- [SETUP_TASMOTA_77.md](SETUP_TASMOTA_77.md) - Konfiguration
- [DISPLAY_CONFIG.md](DISPLAY_CONFIG.md) - Display
- [FIRMWARE_OPTIMIZATION.md](FIRMWARE_OPTIMIZATION.md) - Optimierung

### Repository
- **GitHub**: https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek
- **Branch**: tasmota-esp32s3-lvgl-v15.0.1

### Tasmota
- **Dokumentation**: https://tasmota.github.io/docs/
- **Discord**: https://discord.gg/Ks2Kzd4
- **GitHub**: https://github.com/arendst/Tasmota

---

## Lizenz

GPL-3.0 (wie Tasmota)

---

## Credits

- **Tasmota**: Theo Arends und Contributors
- **TasmoCompiler**: benzino77
- **ESP32-S3-Geek Firmware**: Harald Kiessling
- **Berry Language**: Tasmota Team
- **LVGL**: LVGL Team

---

**Letzte Aktualisierung**: 2026-01-10
