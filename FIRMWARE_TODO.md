# Firmware Kompilierung - TODO

## Status

⚠️ **Die optimierte Firmware muss noch kompiliert werden**

## Konfiguration bereit

✅ **Alle Konfigurationsdateien sind vorbereitet:**
- `compile_request_optimized.json` - TasmoCompiler Konfiguration
- `firmware_output/user_config_override.h` - Tasmota Konfiguration
- `firmware_output/platformio_override.ini` - PlatformIO Build-Config

## Kompilierung durchführen

### Option 1: TasmoCompiler Web-Interface (Empfohlen)

```bash
# 1. TasmoCompiler öffnen
https://gitpod.io/start/#benzino77-tasmocompiler

# 2. Konfiguration hochladen
# Datei: compile_request_optimized.json

# 3. Kompilieren
# Klick auf "Compile"

# 4. Firmware herunterladen
# Download: firmware.bin

# 5. Umbenennen
mv firmware.bin tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin
```

### Option 2: PlatformIO (Lokal)

```bash
# 1. Tasmota klonen
git clone https://github.com/arendst/Tasmota.git
cd Tasmota
git checkout v15.0.1

# 2. Konfiguration kopieren
cp ../firmware_output/user_config_override.h tasmota/
cp ../firmware_output/platformio_override.ini .

# 3. Kompilieren
pio run -e tasmota32s3-geek-optimized

# 4. Firmware kopieren
cp .pio/build/tasmota32s3-geek-optimized/firmware.bin \
   ../tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin
```

## Nach Kompilierung

### 1. Firmware zum Repository hinzufügen

```bash
# Firmware-Datei hinzufügen
git add tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# Commit
git commit -m "Add optimized firmware v15.0.1

- Size: ~1.9-2.0 MB (100-700 KB smaller)
- No WiFi credentials
- Optimized modules removed
- GPIO template pre-configured
- DS18x20 support (up to 10 sensors)
- BME280 support
- LVGL display with CST816S touch"

# Push
git push origin tasmota-esp32s3-lvgl-v15.0.1
```

### 2. Download-Links aktualisieren

In `FIRMWARE_DOWNLOAD.md` aktualisieren:

```markdown
### ESP32-S3-Geek Optimierte Firmware

**Datei**: `tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin`  
**Größe**: [ACTUAL_SIZE] MB  
**Status**: ✅ Verfügbar

**Download:**
```bash
curl -L -o tasmota32s3-optimized.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin"
```
```

### 3. Checksums hinzufügen

```bash
# SHA256 berechnen
sha256sum tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# In FIRMWARE_DOWNLOAD.md eintragen
```

### 4. Release Notes aktualisieren

In `RELEASE_NOTES.md`:

```markdown
### v15.0.1-ESP32S3-Geek-Optimized (2026-01-10)

**Status**: ✅ Verfügbar

**Größe**: [ACTUAL_SIZE] MB

**SHA256**: [CHECKSUM]
```

## Erwartete Ergebnisse

### Firmware-Größe
- **Ziel**: 1.9-2.0 MB
- **Vergleich**: 
  - LVGL v15.0.1: 2.1 MB
  - Matter-HA: 2.7 MB
  - Optimiert: ~1.9-2.0 MB ✅

### Features
- ✅ LVGL Display mit Touch
- ✅ DS18B20 (bis zu 10 Sensoren)
- ✅ BME280 (I2C)
- ✅ Berry Scripting
- ✅ Dateisystem
- ✅ WiFi/MQTT
- ✅ GPIO-Template vorkonfiguriert
- ✅ Keine WiFi-Credentials

### Entfernte Module
- ❌ Energy Sensor
- ❌ Accelerometer (MPU)
- ❌ RTC Chips (BM8563)
- ❌ Unused Touch Controllers
- ❌ Rotary Encoder
- ❌ Buzzer
- ❌ Light Palette
- ❌ Shelly Pro
- ❌ Serial Bridge

## Verifizierung

Nach Kompilierung prüfen:

```bash
# 1. Größe
ls -lh tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# 2. Checksum
sha256sum tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# 3. Firmware-Info
esptool.py image_info tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# 4. Test-Flash (optional)
python3 upload_firmware_77.py tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin 192.168.0.77

# 5. Verifizierung
curl -s "http://192.168.0.77/cm?cmnd=Status%202" | python3 -m json.tool
```

## Dokumentation

Vollständige Anleitung: [COMPILE_INSTRUCTIONS.md](COMPILE_INSTRUCTIONS.md)

## Zeitaufwand

- **TasmoCompiler**: ~5-10 Minuten
- **PlatformIO**: ~10-15 Minuten (erste Kompilierung)
- **PlatformIO**: ~2-5 Minuten (nachfolgende Kompilierungen)

## Nächste Schritte

1. ✅ Konfiguration vorbereitet
2. ⚠️ Firmware kompilieren (siehe oben)
3. ⏳ Firmware zum Repository hinzufügen
4. ⏳ Download-Links aktualisieren
5. ⏳ Checksums hinzufügen
6. ⏳ Release Notes aktualisieren
7. ⏳ Testen und verifizieren

---

**Erstellt**: 2026-01-10  
**Status**: Warte auf Kompilierung
