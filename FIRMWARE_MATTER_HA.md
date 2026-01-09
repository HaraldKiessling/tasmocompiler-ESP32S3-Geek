# Tasmota Firmware für ESP32S3-Geek mit Matter, HomeAssistant & BME280

## Firmware Details

**Datei:** `tasmota32s3-v15.0.1-Matter-HA-BME280.bin`

**Version:** Tasmota 15.0.1  
**Board:** ESP32-S3 (esp32s3-qio_qspi)  
**Build:** ESP32S3-Geek-Matter-HA-BME280  
**Datum:** 2026-01-09  

## Features

### Smart Home Integration
- ✅ **Matter Device Support** - Kompatibel mit Matter-fähigen Smart Home Systemen
- ✅ **Home Assistant Discovery** - Automatische Erkennung in Home Assistant
- ✅ **MQTT Support** - Für Home Assistant MQTT Integration

### Display & UI
- ✅ LVGL (Light and Versatile Graphics Library)
- ✅ HASPmota (Display Framework)
- ✅ Berry Scripting Language
- ✅ Universal Display Support
- ✅ Touch Support (XPT2046, FT5206, GT911, CST816S)
- ✅ ST7789 Display Driver

### Sensoren
- ✅ **BME280** - Temperatur, Luftfeuchtigkeit, Luftdruck (I2C)
- ✅ **10x DS18x20 Sensoren** - Temperatur (OneWire)
- ✅ I2C Support (Multiple BME280, BM8563 RTC, etc.)
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

- **RAM:** 18.9% (61,924 / 327,680 bytes)
- **Flash:** 87.3% (2,574,380 / 2,949,120 bytes)
- **Static IRAM:** 19.1% (68,554 bytes)

## Custom Defines

```c
#define DS18X20_MAX_SENSORS 10
#define SET_ESP32_STACK_SIZE 24576
#define USE_BME280
#define USE_MATTER_DEVICE
#define USE_HOMEASSISTANT
#define CODE_IMAGE_STR "ESP32S3-Geek-Matter-HA-BME280"
```

## Installation

### Via Web-Interface (OTA)
1. Öffnen Sie Tasmota Web-Interface auf tasmota-75
2. Gehen Sie zu "Firmware Upgrade"
3. Wählen Sie die .bin Datei
4. Klicken Sie auf "Start Upgrade"
5. Warten Sie ca. 2-3 Minuten
6. Gerät startet automatisch neu

### Via esptool.py
```bash
esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 921600 \
  write_flash -z 0x0 tasmota32s3-v15.0.1-Matter-HA-BME280.bin
```

## Konfiguration

### Matter Setup
1. Nach dem Flash: Konsole öffnen
2. Befehl: `Matter 1` (Matter aktivieren)
3. QR-Code wird generiert
4. In Matter-App scannen (Apple Home, Google Home, etc.)
5. Gerät wird automatisch hinzugefügt

### Home Assistant Setup

#### Option 1: MQTT Discovery (empfohlen)
1. MQTT Broker konfigurieren:
   ```
   Backlog MqttHost <broker-ip>; MqttUser <user>; MqttPassword <password>
   ```
2. Home Assistant Discovery aktivieren:
   ```
   SetOption19 1
   ```
3. Gerät erscheint automatisch in Home Assistant

#### Option 2: Manuelle Integration
1. In Home Assistant: Configuration → Integrations
2. "Add Integration" → "Tasmota"
3. IP-Adresse eingeben
4. Gerät wird hinzugefügt

### BME280 Sensor
1. BME280 an I2C anschließen (SDA, SCL)
2. Tasmota erkennt automatisch
3. Sensor-Daten erscheinen im Web-Interface
4. Automatisch in Home Assistant verfügbar (via MQTT Discovery)

**I2C Adressen:**
- BME280: 0x76 oder 0x77
- Mehrere BME280 möglich mit verschiedenen Adressen

### DS18x20 Sensoren
- Unterstützt bis zu 10 Sensoren auf einem OneWire Bus
- Sensoren werden als DS18B20-1 bis DS18B20-10 angezeigt
- Automatische Erkennung und Anzeige
- Automatisch in Home Assistant verfügbar

## Home Assistant Entities

Nach erfolgreicher Integration erscheinen folgende Entities:

**Sensoren:**
- `sensor.tasmota_temperature` (BME280)
- `sensor.tasmota_humidity` (BME280)
- `sensor.tasmota_pressure` (BME280)
- `sensor.tasmota_ds18b20_1_temperature` (DS18x20)
- `sensor.tasmota_ds18b20_2_temperature` (DS18x20)
- ... (bis zu 10 DS18x20 Sensoren)

**Schalter:**
- `switch.tasmota_power` (falls konfiguriert)

**Weitere:**
- `binary_sensor.tasmota_status` (Online/Offline)
- `sensor.tasmota_rssi` (WiFi Signal)
- `sensor.tasmota_uptime`

## Matter Kompatibilität

**Unterstützte Matter Controller:**
- ✅ Apple Home (iOS 16.1+)
- ✅ Google Home
- ✅ Amazon Alexa (mit Matter Bridge)
- ✅ Samsung SmartThings
- ✅ Home Assistant (Matter Integration)

**Matter Device Types:**
- Temperature Sensor
- Humidity Sensor
- Pressure Sensor
- Generic Switch/Light (falls konfiguriert)

## Tasmota Befehle

### Matter
```
Matter 1              # Matter aktivieren
Matter 0              # Matter deaktivieren
MatterCommission      # Neuen Pairing-Code generieren
```

### Home Assistant
```
SetOption19 1         # Home Assistant Discovery aktivieren
SetOption19 0         # Home Assistant Discovery deaktivieren
HAssDiscovery         # Discovery manuell triggern
```

### BME280
```
I2CScan               # I2C Geräte scannen
Status 8              # Sensor-Werte anzeigen
TelePeriod 60         # Telemetrie-Intervall (Sekunden)
```

## Troubleshooting

### Matter funktioniert nicht
1. Prüfen: `Matter` Befehl zeigt Status
2. Neustart: `Restart 1`
3. Reset Matter: `Matter 0` dann `Matter 1`
4. Neuer Pairing-Code: `MatterCommission`

### Home Assistant findet Gerät nicht
1. MQTT Verbindung prüfen: `Status 6`
2. Discovery aktivieren: `SetOption19 1`
3. Manuell triggern: `HAssDiscovery`
4. Home Assistant MQTT Integration prüfen

### BME280 nicht erkannt
1. I2C Scan: `I2CScan`
2. Verkabelung prüfen (SDA, SCL, VCC, GND)
3. I2C Adresse prüfen (0x76 oder 0x77)
4. Neustart: `Restart 1`

## Dateien im Repository

- `tasmota32s3-v15.0.1-Matter-HA-BME280.bin` - Firmware
- `pages.jsonl` - Display-Konfiguration
- `autoexec_optimized.be` - Berry-Script (optimiert)
- `FIRMWARE_MATTER_HA.md` - Diese Dokumentation

## Checksumme

**MD5:** Wird nach Upload berechnet

## Kompilierung

**Dauer:** 7:53 Minuten  
**PlatformIO:** v6.1.x  
**IDF Version:** 5.3.3.250501  
**Compiler:** GCC für ESP32-S3

## Unterschiede zur Standard-Firmware

| Feature | Standard | Diese Firmware |
|---------|----------|----------------|
| DS18x20 Sensoren | 8 | 10 |
| LittleFS | 12KB | 320KB |
| Matter | ❌ | ✅ |
| Home Assistant | Basis | Discovery |
| BME280 | ❌ | ✅ |
| Flash Usage | ~70% | 87.3% |

## Support

Bei Fragen oder Problemen:
- GitHub: [HaraldKiessling/tasmocompiler-ESP32S3-Geek](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek)
- Tasmota Dokumentation: [https://tasmota.github.io](https://tasmota.github.io)
- Matter: [https://tasmota.github.io/docs/Matter/](https://tasmota.github.io/docs/Matter/)
- Home Assistant: [https://www.home-assistant.io/integrations/tasmota/](https://www.home-assistant.io/integrations/tasmota/)
