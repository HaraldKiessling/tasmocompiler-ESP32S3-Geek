# Tasmota Firmware für ESP32S3-Geek mit 10 DS18x20 Sensoren

## Firmware Details

**Datei:** `tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin`

**Version:** Tasmota 15.0.1  
**Board:** ESP32-S3 (esp32s3-qio_qspi)  
**Build:** ESP32S3-Geek-10xDS18x20  
**Datum:** 2026-01-09  

## Features

### Display & UI
- ✅ LVGL (Light and Versatile Graphics Library)
- ✅ HASPmota (Display Framework)
- ✅ Berry Scripting Language
- ✅ Universal Display Support
- ✅ Touch Support (XPT2046, FT5206, GT911, CST816S)
- ✅ ST7789 Display Driver

### Sensoren
- ✅ **10x DS18x20 Sensoren** (erweitert von Standard 8)
- ✅ I2C Support (BME280, BM8563 RTC, etc.)
- ✅ SPI Support
- ✅ Energy Sensor Support
- ✅ MPU Accelerometer

### Netzwerk & System
- ✅ WiFi mit Enhanced GUI Scan
- ✅ Rules Engine
- ✅ Serial Bridge
- ✅ Rotary Encoder Support
- ✅ Buzzer Support
- ✅ Light Palette

### Filesystem
- ✅ LittleFS: 320KB (erweitert von Standard 12KB)
- ✅ Unterstützt autoexec.be und pages.jsonl

## Memory Usage

- **RAM:** 18.1% (59,324 / 327,680 bytes)
- **Flash:** 74.6% (2,200,204 / 2,949,120 bytes)

## Custom Defines

```c
#define DS18X20_MAX_SENSORS 10
#define SET_ESP32_STACK_SIZE 24576
#define CODE_IMAGE_STR "ESP32S3-Geek-10xDS18x20"
```

## Installation

### Via Web-Interface (OTA)
1. Öffnen Sie Tasmota Web-Interface
2. Gehen Sie zu "Firmware Upgrade"
3. Wählen Sie die .bin Datei
4. Klicken Sie auf "Start Upgrade"

### Via esptool.py
```bash
esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 921600 \
  write_flash -z 0x0 tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin
```

## Konfiguration

### DS18x20 Sensoren
- Unterstützt bis zu 10 Sensoren auf einem OneWire Bus
- Sensoren werden als DS18B20-1 bis DS18B20-10 angezeigt
- Automatische Erkennung und Anzeige

### Display
- Verwenden Sie `pages.jsonl` für Display-Layout
- Verwenden Sie `autoexec.be` für Berry-Logik
- Optimierte Version mit reduziertem Log-Output verfügbar

## Dateien im Repository

- `tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin` - Firmware
- `pages.jsonl` - Display-Konfiguration
- `autoexec_optimized.be` - Berry-Script (optimiert)
- `OPTIMIERUNG.md` - Dokumentation der Optimierungen

## Checksumme

**MD5:** `64209f511950a97976b8fb094daeff00`

## Kompilierung

**Dauer:** 7:48 Minuten  
**PlatformIO:** v6.1.x  
**IDF Version:** 5.3.3.250501  
**Compiler:** GCC für ESP32-S3

## Support

Bei Fragen oder Problemen:
- GitHub: [HaraldKiessling/tasmocompiler-ESP32S3-Geek](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek)
- Tasmota Dokumentation: [https://tasmota.github.io](https://tasmota.github.io)
