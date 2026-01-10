# 🚀 Tasmota ESP32-S3-Geek - Deployment Package

## Übersicht

Dieses Paket enthält die vollständige Tasmota-Firmware für Waveshare ESP32-S3-Geek mit BME280 und LittleFS Support.

**Firmware-Version**: 15.0.1  
**Build-Datum**: 2026-01-10 13:52 UTC  
**Status**: ✅ Getestet und funktionsfähig

---

## 📦 Paket-Inhalt

### Firmware
- `tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin` (2.7 MB)
- MD5: `0ecc46e94126d688305535f095582ef6`

### Dokumentation
1. **DEPLOYMENT-SUMMARY.md** - Deployment-Zusammenfassung
2. **WAVESHARE-ESP32-S3-GEEK-GUIDE.md** - Vollständige Anleitung
3. **FIRMWARE-DOWNLOAD-LINKS.md** - Download-Links und OTA-URLs
4. **FIRMWARE-DIRECT-DOWNLOAD.md** - Direkte Download-Links und Verifikation
5. **TASMOTA77-DEPLOYMENT-COMPLETE.md** - Tasmota-77 Deployment

### Skripte
- **test-ota-from-server.sh** - OTA-Update von Server
- **force-ota-tasmota-75.sh** - Erzwinge OTA-Upload
- **test-tasmota-75.sh** - Vollständiger Test
- **test-complete-system.sh** - System-Test
- **setup-tasmota-77-fixed.sh** - Setup für 3x DS18B20
- **upload-files-verified.sh** - Datei-Upload mit Verifikation
- **ota-upload-tasmota77.sh** - OTA-Upload für Tasmota-77

### OTA-Server
- **ota-server/index.html** - Web-Interface
- **ota-server/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin** - Firmware

---

## 🎯 Schnellstart

### 1. OTA-Server starten

```bash
cd ota-server
python3 -m http.server 8000
```

**Zugriff**: [https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev](https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev)

### 2. OTA-Update durchführen

```bash
./test-ota-from-server.sh
```

### 3. System testen

```bash
./test-complete-system.sh
```

---

## 📖 Dokumentation

### Hauptdokumentation
Lesen Sie **WAVESHARE-ESP32-S3-GEEK-GUIDE.md** für:
- Firmware-Erstellung
- OTA-Update Methoden
- Konfiguration (WiFi, MQTT, GPIO)
- Datei-Upload
- Berry-Dateien
- MQTT-Anleitung
- Troubleshooting

### Download-Links
Lesen Sie **FIRMWARE-DOWNLOAD-LINKS.md** für:
- OTA-Update Methoden
- Verifikations-Befehle
- Test-Ergebnisse
- Troubleshooting

### Direkte Downloads
Lesen Sie **FIRMWARE-DIRECT-DOWNLOAD.md** für:
- Direkte Download-Links (Web, curl, wget)
- Download-Verifikation (MD5, Dateigröße)
- Alternative Download-Methoden
- Batch-Download für mehrere Geräte
- Mobile Download-Anleitung
- Mirror-Erstellung

### Deployment-Summary
Lesen Sie **DEPLOYMENT-SUMMARY.md** für:
- Firmware-Details
- Test-Ergebnisse
- Verfügbare Skripte
- Wichtige URLs

---

## ✅ Features

- ✅ 10x DS18x20 Temperatursensoren
- ✅ BME280 (I2C) - Temp, Hum, Press
- ✅ ST7789V Display (240x135)
- ✅ CST816S Touch
- ✅ LittleFS (320 KB)
- ✅ LVGL v9.3.0
- ✅ Berry Scripting
- ✅ Matter/Thread
- ✅ MQTT
- ✅ OTA Updates

---

## 🔗 Wichtige Links

### OTA-Server
- **Web**: [https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev](https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev)
- **Firmware**: [https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin](https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin)

### Tasmota-Geräte
- **Tasmota-75**: [https://tasmota-75.samharald.eu](https://tasmota-75.samharald.eu)
- **Tasmota-77**: [https://tasmota-77.samharald.eu](https://tasmota-77.samharald.eu)

### Dokumentation
- **Tasmota**: [https://tasmota.github.io/docs/](https://tasmota.github.io/docs/)
- **Berry**: [https://tasmota.github.io/docs/Berry/](https://tasmota.github.io/docs/Berry/)
- **LVGL**: [https://docs.lvgl.io/](https://docs.lvgl.io/)

---

## 📊 Test-Ergebnisse

Getestet auf **Tasmota-75** (2x BME280):

| Test | Status |
|------|--------|
| OTA-Update | ✅ |
| BME280 Sensor 0x76 | ✅ |
| BME280 Sensor 0x77 | ✅ |
| IP-Adresse | ✅ |
| WiFi SSID | ✅ |
| Uhrzeit (NTP) | ✅ |
| MQTT | ✅ |
| LittleFS | ✅ |
| Berry | ✅ |

---

## 🛠️ Support

Bei Fragen oder Problemen:
1. Lesen Sie die Dokumentation
2. Prüfen Sie die Troubleshooting-Sektion
3. Konsultieren Sie die Tasmota-Community

---

**Status**: ✅ Deployment erfolgreich  
**Letzte Aktualisierung**: 2026-01-10 15:08 UTC
