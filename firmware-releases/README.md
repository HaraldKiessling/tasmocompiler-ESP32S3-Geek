# Tasmota ESP32-S3-Geek Firmware Releases

## v15.0.1 tasmota32s3geek - BME280 & LittleFS (2026-01-10)

### Build-Informationen

- **Version**: Tasmota 15.0.1 (tasmota32s3geek)
- **Build-Datum**: 2026-01-10 16:10 UTC
- **Dateiname**: `tasmota32s3geek-v15.0.1-BME280-LittleFS.bin`
- **Größe**: 2.7 MB (2,790,288 Bytes)
- **MD5**: `9879581181493e9789a7e8ae62c054d8`
- **ESP-IDF**: 5.3.3.250501
- **Hardware**: Waveshare ESP32-S3-Geek
- **Author**: Harald

### Features

- ✅ **10x DS18x20** Temperatursensoren (1-Wire)
- ✅ **BME280** Sensor (I2C) - Temperatur, Luftfeuchtigkeit, Luftdruck
- ✅ **ST7789V Display** (240x135, SPI)
- ✅ **CST816S Touch** Controller
- ✅ **LittleFS** Filesystem (320 KB)
- ✅ **LVGL** Display-Framework (v9.3.0)
- ✅ **Berry** Scripting Engine
- ✅ **Matter/Thread** Support
- ✅ **MQTT** Client
- ✅ **OTA** Updates

---

## 📥 Firmware Download

### Hauptfirmware

**GitHub Raw URL:**
```
https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin
```

**Download via curl:**
```bash
curl -L -o tasmota32s3geek-v15.0.1-BME280-LittleFS.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin"
```

**Download via wget:**
```bash
wget https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin
```

### MD5-Verifikation

**MD5-Datei herunterladen:**
```bash
curl -L -o tasmota32s3geek-v15.0.1-BME280-LittleFS.bin.md5 \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin.md5"
```

**Verifizieren:**
```bash
md5sum -c tasmota32s3geek-v15.0.1-BME280-LittleFS.bin.md5
```

**Erwartete MD5:**
```
9879581181493e9789a7e8ae62c054d8
```

---

## 📦 Berry-Dateien & Skripte

### autoexec.be - Berry Autostart-Skript

**Download:**
```bash
curl -L -o autoexec.be \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/autoexec.be"
```

**Beschreibung:**
- Automatischer Start beim Boot
- Display-Initialisierung
- Sensor-Überwachung
- MQTT-Integration

### pages.jsonl - Display-Seiten

**Download:**
```bash
curl -L -o pages.jsonl \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/pages.jsonl"
```

**Beschreibung:**
- Display-Seiten-Definitionen
- Sensor-Werte-Anzeige
- Touch-Navigation

---

## 🛠️ Setup-Skripte

### setup-tasmota-77.sh - Vollständiges Setup

**Download:**
```bash
curl -L -o setup-tasmota-77.sh \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/setup-tasmota-77.sh"
chmod +x setup-tasmota-77.sh
```

**Funktionen:**
- WiFi-Konfiguration
- MQTT-Setup
- GPIO-Konfiguration (3x DS18B20)
- I2C-Setup (BME280)
- TelePeriod setzen
- WebLog aktivieren

**Verwendung:**
```bash
./setup-tasmota-77.sh
```

### ota-upload-tasmota77.sh - OTA-Upload

**Download:**
```bash
curl -L -o ota-upload-tasmota77.sh \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/ota-upload-tasmota77.sh"
chmod +x ota-upload-tasmota77.sh
```

**Funktionen:**
- Firmware-Upload via OTA
- Neustart-Überwachung
- Versions-Verifikation

**Verwendung:**
```bash
./ota-upload-tasmota77.sh
```

---

## 🔄 OTA-Update

### Via Tasmota-Konsole

```
Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin; Upgrade 1
```

### Via curl

```bash
TASMOTA_IP="tasmota-XX.samharald.eu"
curl -k -s "https://${TASMOTA_IP}/cm?cmnd=Backlog%20OtaUrl%20https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin;Upgrade%201"
```

---

## 📋 Alle Dateien im Repository

| Datei | Beschreibung | Download-Link |
|-------|--------------|---------------|
| **tasmota32s3geek-v15.0.1-BME280-LittleFS.bin** | Hauptfirmware (2.7 MB) | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin) |
| **tasmota32s3geek-v15.0.1-BME280-LittleFS.bin.md5** | MD5-Prüfsumme | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin.md5) |
| **autoexec.be** | Berry Autostart-Skript | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/autoexec.be) |
| **pages.jsonl** | Display-Seiten | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/pages.jsonl) |
| **setup-tasmota-77.sh** | Setup-Skript | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/setup-tasmota-77.sh) |
| **ota-upload-tasmota77.sh** | OTA-Upload-Skript | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/ota-upload-tasmota77.sh) |

---

## ✅ Test-Status

**Getestet auf:**
- ✅ **Tasmota-75** (2x BME280) - Alle Funktionen getestet und funktionsfähig
  - BME280 Sensor 0x76: Temp 3.4°C, Hum 76.5%, Press 971.8 hPa
  - BME280 Sensor 0x77: Temp 9.9°C, Hum 73.7%, Press 972.6 hPa
  - IP-Adresse: 192.168.0.75
  - WiFi SSID: miVida2 (RSSI: 98)
  - Uhrzeit: NTP synchronisiert
  - MQTT: Verbunden (Host: 192.168.0.12)
  - LittleFS: Aktiv
  - Berry: Aktiv

- ✅ **Tasmota-77** (3x DS18B20) - Bereit für Deployment

---

## 📖 Dokumentation

- [WAVESHARE-ESP32-S3-GEEK-GUIDE.md](../WAVESHARE-ESP32-S3-GEEK-GUIDE.md) - Vollständige Anleitung
- [FIRMWARE-DIRECT-DOWNLOAD.md](../FIRMWARE-DIRECT-DOWNLOAD.md) - Download-Anleitung
- [DEPLOYMENT-SUMMARY.md](../DEPLOYMENT-SUMMARY.md) - Deployment-Zusammenfassung
- [QUICK-LINKS.md](../QUICK-LINKS.md) - Schnellzugriff

---

## 🔧 Changelog

### v15.0.1 tasmota32s3geek (2026-01-10 16:10 UTC)
- ✅ Custom Project Name: "tasmota32s3geek"
- ✅ Custom Author: "Harald"
- ✅ BME280 I2C Support
- ✅ LittleFS aktiviert (320 KB)
- ✅ Firmware-Bezeichnung mit Compile-Zeit
- ✅ Getestet auf Tasmota-75 (2x BME280)
- ✅ Alle Dateien in Git verfügbar

---

## 📞 Support

Bei Fragen oder Problemen:
- **GitHub Issues**: [https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/issues](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/issues)
- **Tasmota Docs**: [https://tasmota.github.io/docs/](https://tasmota.github.io/docs/)
- **Tasmota Community**: [https://github.com/arendst/Tasmota/discussions](https://github.com/arendst/Tasmota/discussions)

---

**Letzte Aktualisierung**: 2026-01-10 16:11 UTC  
**Status**: ✅ Getestet und produktionsbereit  
**Author**: Harald
