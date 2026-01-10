# 📦 Tasmota ESP32-S3-Geek Firmware Index

Zentrale Übersicht aller verfügbaren Firmware-Versionen und Download-Links.

---

## 🆕 Aktuelle Version (Empfohlen)

### v15.0.1 Enhanced - BME280 & LittleFS (2026-01-10)

**Build-Informationen:**
- **Version**: Tasmota 15.0.1
- **Build-Datum**: 2026-01-10 13:52 UTC
- **Dateiname**: `tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin`
- **Größe**: 2.7 MB (2,790,256 Bytes)
- **MD5**: `0ecc46e94126d688305535f095582ef6`
- **ESP-IDF**: 5.3.3.250501
- **Hardware**: Waveshare ESP32-S3-Geek

**Features:**
- ✅ 10x DS18x20 Temperatursensoren (1-Wire)
- ✅ BME280 Sensor (I2C) - Temperatur, Luftfeuchtigkeit, Luftdruck
- ✅ ST7789V Display (240x135, SPI)
- ✅ CST816S Touch Controller
- ✅ LittleFS Filesystem (320 KB)
- ✅ LVGL Display-Framework (v9.3.0)
- ✅ Berry Scripting Engine
- ✅ Matter/Thread Support
- ✅ MQTT Client
- ✅ OTA Updates

**Download-Links:**

| Methode | Link |
|---------|------|
| **GitHub Raw** | [tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin) |
| **Repository** | `firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin` |
| **curl** | `curl -L -o firmware.bin "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"` |
| **wget** | `wget https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin` |

**OTA-Update:**
```
Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin; Upgrade 1
```

**Test-Status:**
- ✅ Tasmota-75 (2x BME280) - Alle Funktionen getestet und funktionsfähig
- ✅ Tasmota-77 (3x DS18B20) - Bereit für Deployment

**Dokumentation:**
- [FIRMWARE-DIRECT-DOWNLOAD.md](FIRMWARE-DIRECT-DOWNLOAD.md) - Direkte Download-Links
- [WAVESHARE-ESP32-S3-GEEK-GUIDE.md](WAVESHARE-ESP32-S3-GEEK-GUIDE.md) - Vollständige Anleitung
- [DEPLOYMENT-SUMMARY.md](DEPLOYMENT-SUMMARY.md) - Deployment-Zusammenfassung

---

## 📦 Vorherige Versionen

### v15.0.1 LVGL (2.1 MB)

**Build-Datum**: 2026-01-09  
**Dateiname**: `tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin`

**Features:**
- ✅ LVGL Display mit Touch (CST816S)
- ✅ DS18B20 Temperatursensoren (bis zu 10)
- ✅ Berry Scripting (autoexec.be)
- ✅ File System (pages.jsonl)
- ✅ WiFi/MQTT

**Download:**
```bash
curl -L -o tasmota32s3-lvgl.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin"
```

**Dokumentation:**
- [FIRMWARE_DOWNLOAD.md](FIRMWARE_DOWNLOAD.md)
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)

---

### v15.0.1 Matter-HA-BME280 (2.7 MB)

**Build-Datum**: 2026-01-09  
**Dateiname**: `tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin`

**Features:**
- ✅ Matter/Thread Support
- ✅ Home Assistant Integration
- ✅ BME280 Sensor (I2C)
- ✅ LVGL Display
- ✅ WiFi/MQTT

**Download:**
```bash
curl -L -o tasmota32s3-matter-ha.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin"
```

**Dokumentation:**
- [FIRMWARE_MATTER_HA.md](FIRMWARE_MATTER_HA.md)

---

## 📊 Versions-Vergleich

| Feature | v15.0.1 Enhanced | v15.0.1 LVGL | v15.0.1 Matter-HA |
|---------|------------------|--------------|-------------------|
| **Größe** | 2.7 MB | 2.1 MB | 2.7 MB |
| **Build-Datum** | 2026-01-10 | 2026-01-09 | 2026-01-09 |
| **DS18x20** | ✅ 10x | ✅ 10x | ❌ |
| **BME280** | ✅ I2C | ❌ | ✅ I2C |
| **LittleFS** | ✅ 320 KB | ❌ | ❌ |
| **LVGL** | ✅ v9.3.0 | ✅ v9.3.0 | ✅ v9.3.0 |
| **Berry** | ✅ | ✅ | ✅ |
| **Matter** | ✅ | ❌ | ✅ |
| **Getestet** | ✅ | ✅ | ⚠️ |

**Empfehlung**: v15.0.1 Enhanced für maximale Funktionalität und Flexibilität.

---

## 🔍 Firmware-Verifikation

### MD5-Prüfsummen

| Version | MD5 |
|---------|-----|
| v15.0.1 Enhanced | `0ecc46e94126d688305535f095582ef6` |
| v15.0.1 LVGL | *(siehe FIRMWARE_DOWNLOAD.md)* |
| v15.0.1 Matter-HA | *(siehe FIRMWARE_MATTER_HA.md)* |

### Verifikation durchführen

**Linux/macOS:**
```bash
md5sum tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Windows (PowerShell):**
```powershell
Get-FileHash -Algorithm MD5 tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

---

## 📖 Dokumentations-Index

### Aktuelle Dokumentation (v15.0.1 Enhanced)

| Dokument | Beschreibung |
|----------|--------------|
| [QUICK-LINKS.md](QUICK-LINKS.md) | Schnellzugriff auf alle Links |
| [FIRMWARE-DIRECT-DOWNLOAD.md](FIRMWARE-DIRECT-DOWNLOAD.md) | Direkte Download-Links & Verifikation |
| [FIRMWARE-DOWNLOAD-LINKS.md](FIRMWARE-DOWNLOAD-LINKS.md) | OTA-Update Methoden |
| [WAVESHARE-ESP32-S3-GEEK-GUIDE.md](WAVESHARE-ESP32-S3-GEEK-GUIDE.md) | Vollständige Anleitung |
| [DEPLOYMENT-SUMMARY.md](DEPLOYMENT-SUMMARY.md) | Deployment-Zusammenfassung |
| [README-DEPLOYMENT.md](README-DEPLOYMENT.md) | Paket-Übersicht |

### Vorherige Dokumentation

| Dokument | Beschreibung |
|----------|--------------|
| [FIRMWARE_DOWNLOAD.md](FIRMWARE_DOWNLOAD.md) | Download-Anleitung (LVGL Version) |
| [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) | Installations-Anleitung |
| [SETUP_TASMOTA_77.md](SETUP_TASMOTA_77.md) | Konfigurations-Anleitung |
| [DISPLAY_CONFIG.md](DISPLAY_CONFIG.md) | Display-Konfiguration |
| [FIRMWARE_OPTIMIZATION.md](FIRMWARE_OPTIMIZATION.md) | Optimierungs-Details |

---

## 🚀 Schnellstart

### 1. Firmware herunterladen

```bash
curl -L -o tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
```

### 2. MD5 verifizieren

```bash
# MD5-Datei herunterladen
curl -L -o tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin.md5 \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin.md5"

# Verifizieren
md5sum -c tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin.md5
# Erwartete Ausgabe: tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin: OK
```

### 3. OTA-Update durchführen

**Via Tasmota-Konsole:**
```
Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin; Upgrade 1
```

**Via curl:**
```bash
TASMOTA_IP="tasmota-XX.samharald.eu"
curl -k -s "https://${TASMOTA_IP}/cm?cmnd=Backlog%20OtaUrl%20https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin;Upgrade%201"
```

### 4. Verifikation

```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%202" | jq '.StatusFWR'
```

---

## 🔗 Repository-Links

### GitHub Repository
- **Main**: [https://github.com/benzino77/tasmocompiler](https://github.com/benzino77/tasmocompiler)
- **ESP32-S3-Geek Branch**: [https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek)

### Lokale Pfade (Gitpod Workspace)
- **Firmware**: `/workspaces/tasmocompiler/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin`
- **OTA-Server**: `/workspaces/tasmocompiler/ota-server/`
- **Dokumentation**: `/workspaces/tasmocompiler/*.md`

---

## 🌐 Externe Ressourcen

### Tasmota
- **Dokumentation**: [https://tasmota.github.io/docs/](https://tasmota.github.io/docs/)
- **GitHub**: [https://github.com/arendst/Tasmota](https://github.com/arendst/Tasmota)
- **Community**: [https://github.com/arendst/Tasmota/discussions](https://github.com/arendst/Tasmota/discussions)

### Hardware
- **Waveshare ESP32-S3-Geek**: [https://www.waveshare.com/wiki/ESP32-S3-Geek](https://www.waveshare.com/wiki/ESP32-S3-Geek)
- **BME280**: [https://tasmota.github.io/docs/BME280/](https://tasmota.github.io/docs/BME280/)
- **DS18x20**: [https://tasmota.github.io/docs/DS18x20/](https://tasmota.github.io/docs/DS18x20/)

### Software
- **Berry**: [https://tasmota.github.io/docs/Berry/](https://tasmota.github.io/docs/Berry/)
- **LVGL**: [https://docs.lvgl.io/](https://docs.lvgl.io/)
- **Matter**: [https://tasmota.github.io/docs/Matter/](https://tasmota.github.io/docs/Matter/)

---

## 📞 Support

Bei Fragen oder Problemen:

1. **Dokumentation lesen**: Siehe oben für vollständige Anleitungen
2. **Issues erstellen**: [GitHub Issues](https://github.com/benzino77/tasmocompiler/issues)
3. **Community fragen**: [Tasmota Discussions](https://github.com/arendst/Tasmota/discussions)
4. **Discord/Telegram**: Tasmota Community Channels

---

## 📝 Changelog

### v15.0.1 Enhanced (2026-01-10)
- ✅ BME280 I2C Support hinzugefügt
- ✅ LittleFS aktiviert (320 KB)
- ✅ Firmware-Bezeichnung mit Compile-Zeit erweitert
- ✅ Getestet auf Tasmota-75 (2x BME280)
- ✅ OTA-Server eingerichtet
- ✅ Vollständige Dokumentation erstellt

### v15.0.1 LVGL (2026-01-09)
- ✅ LVGL Display Support
- ✅ 10x DS18B20 Support
- ✅ Berry Scripting
- ✅ Optimierte Größe (2.1 MB)

### v15.0.1 Matter-HA (2026-01-09)
- ✅ Matter/Thread Support
- ✅ Home Assistant Integration
- ✅ BME280 Support

---

**Letzte Aktualisierung**: 2026-01-10 15:15 UTC  
**Status**: ✅ Alle Links aktiv und getestet  
**Empfohlene Version**: v15.0.1 Enhanced
