# Firmware Download

## Verfügbare Firmware-Versionen

### ESP32-S3-Geek Optimierte Firmware (Empfohlen)

**Version**: v15.0.1-ESP32S3-Geek-Optimized  
**Größe**: ~1.9-2.0 MB (nach Kompilierung)  
**Status**: Konfiguration verfügbar, muss kompiliert werden

**Features:**
- ✅ LVGL Display mit Touch (CST816S)
- ✅ DS18B20 Temperatursensoren (bis zu 10)
- ✅ BME280 Umweltsensor (I2C)
- ✅ Berry Scripting (autoexec.be)
- ✅ Dateisystem (pages.jsonl)
- ✅ WiFi/MQTT
- ✅ Optimiert: 100-700 KB kleiner

**Kompilierung:**
```bash
# Konfiguration verwenden
./compile_optimized.sh

# Oder TasmoCompiler Web-Interface
# Upload: compile_request_optimized.json
```

**Dokumentation:**
- [FIRMWARE_OPTIMIZATION.md](FIRMWARE_OPTIMIZATION.md) - Optimierungs-Details
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) - Deployment-Anleitung

---

### ESP32-S3-Geek LVGL v15.0.1 (Verfügbar)

**Datei**: `tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin`  
**Größe**: 2.1 MB  
**Status**: ✅ Fertig kompiliert

**Download:**
```bash
# Via Git
git clone https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek.git
cd tasmocompiler-ESP32S3-Geek
git checkout tasmota-esp32s3-lvgl-v15.0.1

# Firmware-Datei
ls -lh tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin
```

**GitHub Raw Link:**
```
https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin
```

**Features:**
- ✅ LVGL Display mit Touch
- ✅ DS18B20 Temperatursensoren (bis zu 10)
- ✅ BME280 Umweltsensor
- ✅ Berry Scripting
- ✅ Dateisystem
- ✅ WiFi/MQTT
- ⚠️ Größer als optimierte Version

---

### Matter-HA-BME280 v15.0.1 (Verfügbar)

**Datei**: `tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin`  
**Größe**: 2.7 MB  
**Status**: ✅ Fertig kompiliert

**Download:**
```bash
# Via Git
git clone https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek.git
cd tasmocompiler-ESP32S3-Geek
git checkout tasmota-esp32s3-lvgl-v15.0.1

# Firmware-Datei
ls -lh tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin
```

**GitHub Raw Link:**
```
https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin
```

**Features:**
- ✅ Matter-Protokoll
- ✅ Home Assistant Integration
- ✅ BME280 Sensor
- ✅ LVGL Display
- ⚠️ Größte Firmware (2.7 MB)

---

## Download-Methoden

### Methode 1: Git Clone (Empfohlen)

```bash
# Repository klonen
git clone https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek.git
cd tasmocompiler-ESP32S3-Geek

# Branch wechseln
git checkout tasmota-esp32s3-lvgl-v15.0.1

# Verfügbare Firmware-Dateien
ls -lh *.bin
```

### Methode 2: Direkter Download (curl)

```bash
# LVGL Version
curl -L -o tasmota32s3-lvgl.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin"

# Matter-HA Version
curl -L -o tasmota32s3-matter-ha.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin"
```

### Methode 3: Direkter Download (wget)

```bash
# LVGL Version
wget -O tasmota32s3-lvgl.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin"

# Matter-HA Version
wget -O tasmota32s3-matter-ha.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin"
```

### Methode 4: GitHub Web-Interface

1. Öffne: https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek
2. Wechsle zu Branch: `tasmota-esp32s3-lvgl-v15.0.1`
3. Klicke auf Firmware-Datei (z.B. `tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin`)
4. Klicke auf "Download" oder "Raw"

---

## Firmware-Vergleich

| Feature | Optimiert | LVGL v15.0.1 | Matter-HA |
|---------|-----------|--------------|-----------|
| **Größe** | ~1.9-2.0 MB | 2.1 MB | 2.7 MB |
| **LVGL Display** | ✅ | ✅ | ✅ |
| **DS18B20 (10x)** | ✅ | ✅ | ❌ |
| **BME280** | ✅ | ✅ | ✅ |
| **Berry** | ✅ | ✅ | ✅ |
| **Matter** | ❌ | ❌ | ✅ |
| **Home Assistant** | ❌ | ❌ | ✅ |
| **Optimiert** | ✅ | ❌ | ❌ |
| **Status** | Kompilierung nötig | ✅ Verfügbar | ✅ Verfügbar |

---

## Installation

### Nach dem Download

```bash
# Firmware flashen (OTA)
python3 upload_firmware_77.py tasmota32s3-lvgl.bin 192.168.0.77

# Oder via esptool (seriell)
esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 921600 \
  write_flash -z 0x0 tasmota32s3-lvgl.bin

# Konfiguration
./setup-tasmota-77.sh 192.168.0.77 "MeinWLAN" "MeinPasswort"

# Display-Dateien hochladen
python3 upload_77_autoexec.py
python3 upload_77_pages.py
```

**Vollständige Anleitung:**
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)

---

## Checksums (SHA256)

Zur Verifizierung der Firmware-Integrität:

```bash
# Checksum berechnen
sha256sum tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin

# Erwartete Checksums (Beispiel - nach Download prüfen)
# tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin: [checksum]
# tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin: [checksum]
```

---

## Eigene Firmware kompilieren

### Optimierte Version (Empfohlen)

```bash
# Konfigurationsdateien generieren
./compile_optimized.sh

# TasmoCompiler verwenden
# 1. Öffne: https://gitpod.io/start/#benzino77-tasmocompiler
# 2. Upload: compile_request_optimized.json
# 3. Compile
# 4. Download: firmware.bin
```

### Anpassungen

**user_config_override.h bearbeiten:**
```c
// Eigene Anpassungen
#define MY_CUSTOM_SETTING value

// Dann kompilieren mit PlatformIO
pio run -e tasmota32s3-geek-optimized
```

**Dokumentation:**
- [FIRMWARE_OPTIMIZATION.md](FIRMWARE_OPTIMIZATION.md)
- [firmware_output/README.md](firmware_output/README.md)

---

## Support und Dokumentation

### Dokumentation
- [README.md](README.md) - Projekt-Übersicht
- [SETUP_TASMOTA_77.md](SETUP_TASMOTA_77.md) - Setup-Anleitung
- [DISPLAY_CONFIG.md](DISPLAY_CONFIG.md) - Display-Konfiguration
- [FIRMWARE_OPTIMIZATION.md](FIRMWARE_OPTIMIZATION.md) - Optimierung
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) - Deployment

### Repository
- **GitHub**: https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek
- **Branch**: tasmota-esp32s3-lvgl-v15.0.1
- **Original**: https://github.com/benzino77/tasmocompiler

### Tasmota
- **Dokumentation**: https://tasmota.github.io/docs/
- **Berry**: https://tasmota.github.io/docs/Berry/
- **HASPmota**: https://tasmota.github.io/docs/HASPmota/

---

## Lizenz

Dieses Projekt basiert auf Tasmota und steht unter der gleichen Lizenz (GPL-3.0).

---

## Changelog

### v15.0.1-ESP32S3-Geek-Optimized (2026-01-10)
- ✅ Optimierte Firmware-Konfiguration
- ✅ 100-700 KB kleiner
- ✅ Unnötige Module entfernt
- ✅ GPIO-Template vorkonfiguriert
- ✅ Keine WiFi-Credentials

### v15.0.1-ESP32S3-Geek-10xDS18x20 (2026-01-09)
- ✅ LVGL Display Support
- ✅ 10x DS18B20 Sensoren
- ✅ BME280 Sensor
- ✅ Berry Scripting
- ✅ Optimiertes Display-Layout

### v15.0.1-Matter-HA-BME280 (2026-01-09)
- ✅ Matter-Protokoll
- ✅ Home Assistant Integration
- ✅ BME280 Sensor
- ✅ LVGL Display

---

## Häufige Fragen (FAQ)

**Q: Welche Firmware soll ich verwenden?**  
A: Für die meisten Anwendungen: LVGL v15.0.1 (verfügbar) oder Optimierte Version (nach Kompilierung).

**Q: Wie groß ist die Firmware?**  
A: LVGL: 2.1 MB, Matter-HA: 2.7 MB, Optimiert: ~1.9-2.0 MB

**Q: Muss ich WiFi konfigurieren?**  
A: Ja, die Firmware enthält keine vorkonfigurierten WiFi-Zugangsdaten. Nach dem ersten Flash startet das Gerät im AP-Modus.

**Q: Wie lade ich Display-Dateien hoch?**  
A: Via Web-Interface (Manage File System) oder Python-Skripte (upload_77_autoexec.py, upload_77_pages.py).

**Q: Kann ich die Firmware anpassen?**  
A: Ja, bearbeite user_config_override.h und kompiliere mit PlatformIO oder TasmoCompiler.

**Q: Wo finde ich die GPIO-Konfiguration?**  
A: In SETUP_TASMOTA_77.md oder automatisch via USER_TEMPLATE in der Firmware.

---

**Letzte Aktualisierung**: 2026-01-10
