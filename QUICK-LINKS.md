# 🔗 Tasmota ESP32-S3-Geek - Schnellzugriff Links

## 📥 Firmware Download

### GitHub Raw (Permanent)
```
https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

### Repository Path
```
firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

### Download via curl
```bash
curl -L -o tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
```

### Download via wget
```bash
wget https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

---

## 🌐 Tasmota-Geräte

### Tasmota-75
```
https://tasmota-75.samharald.eu
```

### Tasmota-77
```
https://tasmota-77.samharald.eu
```

---

## 📖 Dokumentation

### Hauptanleitung
- **WAVESHARE-ESP32-S3-GEEK-GUIDE.md** - Vollständige Anleitung

### Download-Links
- **FIRMWARE-DIRECT-DOWNLOAD.md** - Direkte Download-Links
- **FIRMWARE-DOWNLOAD-LINKS.md** - OTA-Update Methoden

### Deployment
- **DEPLOYMENT-SUMMARY.md** - Zusammenfassung
- **README-DEPLOYMENT.md** - Paket-Übersicht

---

## 🚀 Schnellstart-Befehle

### OTA-Update von Server
```bash
./test-ota-from-server.sh
```

### System-Test
```bash
./test-complete-system.sh
```

### GPIO-Setup (3x DS18B20)
```bash
./setup-tasmota-77-fixed.sh
```

### Datei-Upload
```bash
./upload-files-verified.sh
```

---

## 🔄 OTA-Update via Tasmota-Konsole

### Für alle Geräte
```
Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin; Upgrade 1
```

### Via curl
```bash
TASMOTA_IP="tasmota-XX.samharald.eu"
curl -k -s "https://${TASMOTA_IP}/cm?cmnd=Backlog%20OtaUrl%20https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin;Upgrade%201"
```

---

## ✅ Verifikation

### Firmware-Version prüfen
```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%202" | jq '.StatusFWR'
```

### BME280 Sensoren prüfen
```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=I2CScan"
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%208" | jq '.StatusSNS'
```

### MD5-Prüfsumme
```bash
md5sum tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
# Erwartete Ausgabe: 0ecc46e94126d688305535f095582ef6
```

---

## 📊 Firmware-Informationen

| Parameter | Wert |
|-----------|------|
| **Version** | Tasmota 15.0.1 |
| **Build-Datum** | 2026-01-10 13:52 UTC |
| **Größe** | 2.7 MB (2,790,256 Bytes) |
| **MD5** | 0ecc46e94126d688305535f095582ef6 |
| **Hardware** | Waveshare ESP32-S3-Geek |
| **ESP-IDF** | 5.3.3.250501 |

---

## 🌟 Features

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

## 🔗 Externe Ressourcen

### Tasmota
- **Dokumentation**: [https://tasmota.github.io/docs/](https://tasmota.github.io/docs/)
- **GitHub**: [https://github.com/arendst/Tasmota](https://github.com/arendst/Tasmota)
- **Community**: [https://github.com/arendst/Tasmota/discussions](https://github.com/arendst/Tasmota/discussions)

### Berry
- **Dokumentation**: [https://tasmota.github.io/docs/Berry/](https://tasmota.github.io/docs/Berry/)
- **Cookbook**: [https://tasmota.github.io/docs/Berry-Cookbook/](https://tasmota.github.io/docs/Berry-Cookbook/)

### LVGL
- **Dokumentation**: [https://docs.lvgl.io/](https://docs.lvgl.io/)
- **Examples**: [https://docs.lvgl.io/master/examples.html](https://docs.lvgl.io/master/examples.html)

### Sensoren
- **BME280**: [https://tasmota.github.io/docs/BME280/](https://tasmota.github.io/docs/BME280/)
- **DS18x20**: [https://tasmota.github.io/docs/DS18x20/](https://tasmota.github.io/docs/DS18x20/)

---

**Letzte Aktualisierung**: 2026-01-10 15:12 UTC  
**Status**: ✅ Alle Links aktiv und getestet
