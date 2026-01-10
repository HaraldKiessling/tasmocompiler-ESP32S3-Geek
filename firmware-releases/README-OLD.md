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

### Download

**Lokaler Pfad im Repository:**
```
firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**GitHub Raw URL (nach Push):**
```
https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Download via curl:**
```bash
curl -L -o tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
```

**Download via wget:**
```bash
wget https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

### MD5-Verifikation

**MD5-Datei:**
```
firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin.md5
```

**Verifikation:**
```bash
md5sum -c tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin.md5
```

**Erwartete MD5:**
```
0ecc46e94126d688305535f095582ef6
```

### OTA-Update

**Via Tasmota-Konsole:**
```
Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin; Upgrade 1
```

**Via curl:**
```bash
TASMOTA_IP="tasmota-XX.samharald.eu"
curl -k -s "https://${TASMOTA_IP}/cm?cmnd=Backlog%20OtaUrl%20https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin;Upgrade%201"
```

### Test-Status

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

### Dokumentation

- [WAVESHARE-ESP32-S3-GEEK-GUIDE.md](../WAVESHARE-ESP32-S3-GEEK-GUIDE.md) - Vollständige Anleitung
- [FIRMWARE-DIRECT-DOWNLOAD.md](../FIRMWARE-DIRECT-DOWNLOAD.md) - Download-Anleitung
- [DEPLOYMENT-SUMMARY.md](../DEPLOYMENT-SUMMARY.md) - Deployment-Zusammenfassung
- [QUICK-LINKS.md](../QUICK-LINKS.md) - Schnellzugriff

### Changelog

**v15.0.1 Enhanced (2026-01-10):**
- ✅ BME280 I2C Support hinzugefügt
- ✅ LittleFS aktiviert (320 KB)
- ✅ Firmware-Bezeichnung mit Compile-Zeit erweitert
- ✅ Getestet auf Tasmota-75 (2x BME280)
- ✅ Vollständige Dokumentation erstellt

### Support

Bei Fragen oder Problemen:
- **GitHub Issues**: [https://github.com/benzino77/tasmocompiler/issues](https://github.com/benzino77/tasmocompiler/issues)
- **Tasmota Docs**: [https://tasmota.github.io/docs/](https://tasmota.github.io/docs/)
- **Tasmota Community**: [https://github.com/arendst/Tasmota/discussions](https://github.com/arendst/Tasmota/discussions)

---

**Letzte Aktualisierung**: 2026-01-10 15:51 UTC  
**Status**: ✅ Getestet und produktionsbereit
