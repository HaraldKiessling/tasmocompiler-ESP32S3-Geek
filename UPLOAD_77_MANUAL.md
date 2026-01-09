# Manuelle Upload-Anleitung für tasmota-77

## Problem
Die Firmware `tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin` (2.7 MB) ist zu groß für automatischen Upload via curl/Python.

## Lösung: Manueller Upload

### Schritt 1: Firmware herunterladen

Download von GitHub:
- Repository: [HaraldKiessling/tasmocompiler-ESP32S3-Geek](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek)
- Branch: `tasmota-esp32s3-lvgl-v15.0.1`
- Datei: `tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin`

**MD5 Checksumme:** `94d7cc5040084ac2282a686128b193a9`

### Schritt 2: Firmware hochladen

1. Öffnen Sie [https://tasmota-77.samharald.eu](https://tasmota-77.samharald.eu)
2. Klicken Sie auf **"Firmware Upgrade"**
3. Klicken Sie auf **"Choose File"**
4. Wählen Sie `tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin`
5. Klicken Sie auf **"Start Upgrade"**
6. Warten Sie 2-3 Minuten
7. Gerät startet automatisch neu

**⚠️ WICHTIG:** Stromversorgung NICHT unterbrechen während des Uploads!

### Schritt 3: Display-Dateien hochladen

Nach erfolgreichem Firmware-Upload:

#### 3.1 pages.jsonl hochladen

1. Öffnen Sie [https://tasmota-77.samharald.eu](https://tasmota-77.samharald.eu)
2. Gehen Sie zu **"Consoles"** → **"Manage File system"**
3. Löschen Sie alte `pages.jsonl` (falls vorhanden)
4. Klicken Sie auf **"Choose File"**
5. Wählen Sie `pages.jsonl` aus dem Repository
6. Klicken Sie auf **"Upload"**

#### 3.2 autoexec.be hochladen

1. Im gleichen **"Manage File system"** Menü
2. Löschen Sie alte `autoexec.be` (falls vorhanden)
3. Klicken Sie auf **"Choose File"**
4. Wählen Sie `autoexec.be` aus dem Repository
5. Klicken Sie auf **"Upload"**

### Schritt 4: Neustart

1. Öffnen Sie **"Consoles"** → **"Console"**
2. Geben Sie ein: `Restart 1`
3. Warten Sie 30 Sekunden

### Schritt 5: Verifizierung

Nach dem Neustart sollte das Display zeigen:

**Header:**
- IP-Adresse: `192.168.0.77`
- SSID: `miVida2`
- Uhrzeit: `HH:MM:SS` (mit Sekunden)
- WiFi-Signal-Anzeige

**BME280 Sensoren (falls angeschlossen):**
- BME280-76: `X.X°C XX%`
- BME280-77: `X.X°C XX%`

**DS18B20 Sensoren (falls angeschlossen):**
- Bis zu 10 Sensoren in 2 Spalten

### Schritt 6: Prüfung in Console

Öffnen Sie die Console und prüfen Sie:

```
Status 2
```
Sollte zeigen: `Version":"15.0.1(ESP32S3-Matter-HA-BME280)`

```
I2CScan
```
Sollte BME280 Sensoren zeigen (falls angeschlossen)

```
Status 8
```
Sollte Sensor-Werte zeigen

## Alternative: esptool.py

Falls Web-Upload nicht funktioniert:

1. ESP32 mit USB verbinden
2. Boot-Modus aktivieren (Boot-Button beim Einschalten)
3. Flash-Befehl:

```bash
esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 921600 \
  write_flash -z 0x0 tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin
```

## Dateien im Repository

Alle benötigten Dateien:
- `tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin` - Firmware (2.7 MB)
- `pages.jsonl` - Display-Konfiguration (2.3 KB)
- `autoexec.be` - Berry-Script (9.0 KB)
- `FIRMWARE_MATTER_HA.md` - Dokumentation

## Features der neuen Firmware

- ✅ Matter Device Support
- ✅ Home Assistant Discovery
- ✅ BME280 Sensor Support (I2C)
- ✅ 10x DS18x20 Sensoren (erweitert von 8)
- ✅ LVGL Display
- ✅ 320KB LittleFS (erweitert von 12KB)
- ✅ Optimierte IP/SSID Extraktion via JSON

## Troubleshooting

### Upload schlägt fehl
- Prüfen Sie freien Speicher: `Status 2`
- Versuchen Sie esptool.py Methode
- Stellen Sie sicher, dass keine andere Firmware-Operation läuft

### Display zeigt nichts
- Prüfen Sie ob pages.jsonl hochgeladen wurde
- Prüfen Sie ob autoexec.be hochgeladen wurde
- Restart: `Restart 1`

### BME280 nicht erkannt
- Prüfen Sie I2C Verkabelung
- Führen Sie aus: `I2CScan`
- BME280 sollte an 0x76 oder 0x77 erscheinen

### IP zeigt 0.0.0.0
- Warten Sie 60 Sekunden (erste Abfrage)
- Prüfen Sie WiFi-Verbindung: `Status 5`
- Neustart: `Restart 1`

## Support

Bei Problemen:
- GitHub: [HaraldKiessling/tasmocompiler-ESP32S3-Geek](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek)
- Tasmota Docs: [https://tasmota.github.io](https://tasmota.github.io)
