# Kompilierungs-Anleitung: Optimierte Firmware

## Übersicht

Diese Anleitung beschreibt, wie die optimierte Firmware für den ESP32-S3-Geek kompiliert wird.

**Konfiguration**: `compile_request_optimized.json`  
**Erwartete Größe**: ~1.9-2.0 MB  
**Einsparung**: 100-700 KB gegenüber Standard-Firmware

## Voraussetzungen

- Zugang zu TasmoCompiler Web-Interface
- Oder: PlatformIO Installation für lokale Kompilierung
- Konfigurationsdatei: `compile_request_optimized.json`

## Methode 1: TasmoCompiler Web-Interface (Empfohlen)

### Schritt 1: TasmoCompiler öffnen

**Option A: Gitpod (Online)**
```
https://gitpod.io/start/#benzino77-tasmocompiler
```

**Option B: Lokale Installation**
```bash
git clone https://github.com/benzino77/tasmocompiler.git
cd tasmocompiler
npm install
npm start
```

### Schritt 2: Konfiguration hochladen

1. **Öffne TasmoCompiler** im Browser
2. **Klicke auf "Upload Configuration"** (falls verfügbar)
3. **Wähle Datei**: `compile_request_optimized.json`
4. **Oder: Manuelle Eingabe** (siehe unten)

### Schritt 3: Manuelle Konfiguration (falls Upload nicht verfügbar)

**Version:**
- Tasmota Version: `v15.0.1`

**Board:**
- Board: `ESP32-S3`

**Features aktivieren:**
- ✅ LVGL
- ✅ Berry
- ✅ File System (ufilesys)
- ✅ Rules
- ✅ I2C
- ✅ SPI
- ✅ Display
- ✅ Universal Display
- ✅ Universal Touch
- ✅ CST816S
- ✅ Display LVGL Only
- ✅ Enhanced GUI WiFi Scan

**Features NICHT aktivieren:**
- ❌ Energy Sensor
- ❌ MPU Accelerometer
- ❌ RTC Chips
- ❌ BM8563
- ❌ XPT2046
- ❌ FT5206
- ❌ GT911
- ❌ Rotary V1
- ❌ Buzzer
- ❌ Light Palette
- ❌ Shelly Pro
- ❌ Serial Bridge

**Network Settings:**
- WiFi SSID: (leer lassen)
- WiFi Password: (leer lassen)
- IP Address: (leer lassen)
- Gateway: (leer lassen)
- Subnet Mask: (leer lassen)
- DNS: (leer lassen)

**Language:**
- Language: `en-GB` (oder gewünschte Sprache)

**Custom Parameters:**
```c
#undef SET_ESP32_STACK_SIZE
#define SET_ESP32_STACK_SIZE (24 * 1024)
#undef DS18X20_MAX_SENSORS
#define DS18X20_MAX_SENSORS 10
#define USE_DS18x20
#define USE_BME280
#define USER_TEMPLATE "{\"NAME\":\"ESP32S3-Geek\",\"GPIO\":[32,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,640,608,0,0,0,0,8896,8960,8800,8832,8864,8928,0,6210,0,0,3200,3232,0,0,0,0],\"FLAG\":0,\"BASE\":1}"
#define MODULE 0
#define FALLBACK_MODULE 0
#define FIRMWARE_VERSION_SUFFIX "-ESP32S3-Geek-Optimized"
```

### Schritt 4: Kompilierung starten

1. **Klicke auf "Compile"**
2. **Warte auf Fertigstellung** (~5-10 Minuten)
3. **Beobachte Log-Ausgabe** auf Fehler

### Schritt 5: Firmware herunterladen

Nach erfolgreicher Kompilierung:

1. **Download**: `firmware.bin`
2. **Optional**: `firmware.bin.gz` (komprimiert)
3. **Optional**: `user_config_override.h` (Konfiguration)
4. **Optional**: `platformio_override.ini` (Build-Config)

**Umbenennen:**
```bash
mv firmware.bin tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin
```

## Methode 2: PlatformIO (Lokal)

### Schritt 1: Tasmota Repository klonen

```bash
# Repository klonen
git clone https://github.com/arendst/Tasmota.git
cd Tasmota

# Version v15.0.1 auschecken
git checkout v15.0.1
```

### Schritt 2: Konfigurationsdateien kopieren

```bash
# user_config_override.h kopieren
cp ../firmware_output/user_config_override.h tasmota/

# platformio_override.ini kopieren
cp ../firmware_output/platformio_override.ini .
```

### Schritt 3: PlatformIO installieren (falls nicht vorhanden)

```bash
# Via pip
pip install platformio

# Oder via Homebrew (macOS)
brew install platformio

# Oder via apt (Linux)
sudo apt install platformio
```

### Schritt 4: Kompilieren

```bash
# Kompilierung starten
pio run -e tasmota32s3-geek-optimized

# Oder für Standard ESP32-S3
pio run -e tasmota32s3
```

### Schritt 5: Firmware finden

```bash
# Firmware-Datei
ls -lh .pio/build/tasmota32s3-geek-optimized/firmware.bin

# Oder
ls -lh .pio/build/tasmota32s3/firmware.bin

# Kopieren
cp .pio/build/tasmota32s3-geek-optimized/firmware.bin \
   ../tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin
```

## Methode 3: Docker (Isoliert)

### Schritt 1: Docker-Image bauen

```bash
# Dockerfile erstellen
cat > Dockerfile.tasmota << 'EOF'
FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip install platformio

WORKDIR /workspace

CMD ["/bin/bash"]
EOF

# Image bauen
docker build -f Dockerfile.tasmota -t tasmota-builder .
```

### Schritt 2: Kompilieren im Container

```bash
# Container starten
docker run -it -v $(pwd):/workspace tasmota-builder

# Im Container:
git clone https://github.com/arendst/Tasmota.git
cd Tasmota
git checkout v15.0.1
cp /workspace/firmware_output/user_config_override.h tasmota/
cp /workspace/firmware_output/platformio_override.ini .
pio run -e tasmota32s3-geek-optimized
cp .pio/build/tasmota32s3-geek-optimized/firmware.bin /workspace/
exit
```

## Verifizierung

### Firmware-Größe prüfen

```bash
# Größe anzeigen
ls -lh tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# Erwartete Größe: ~1.9-2.0 MB (1,900,000 - 2,000,000 Bytes)
```

### Checksum berechnen

```bash
# SHA256
sha256sum tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# MD5
md5sum tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin
```

### Firmware-Informationen

```bash
# Mit esptool
esptool.py image_info tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# Erwartete Ausgabe:
# - Chip: ESP32-S3
# - Flash size: 16MB
# - Entry point: 0x...
```

## Test-Flash (Optional)

### Serieller Test-Flash

```bash
# Backup erstellen (falls Gerät bereits läuft)
curl -s "http://192.168.0.77/dl" > backup-$(date +%Y%m%d).dmp

# Firmware flashen
esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 921600 \
  write_flash -z 0x0 tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# Serielle Konsole öffnen
screen /dev/ttyUSB0 115200
```

### OTA Test-Flash

```bash
# Firmware hochladen
python3 upload_firmware_77.py tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin 192.168.0.77

# Status prüfen
curl -s "http://192.168.0.77/cm?cmnd=Status%202" | python3 -m json.tool
```

### Verifizierung nach Flash

```bash
# Firmware-Version prüfen
curl -s "http://192.168.0.77/cm?cmnd=Status%202" | python3 -m json.tool

# Erwartete Ausgabe:
# "Version": "15.0.1(ESP32S3-Geek-Optimized)"

# Sensoren prüfen
curl -s "http://192.168.0.77/cm?cmnd=Status%208" | python3 -m json.tool

# GPIO prüfen
curl -s "http://192.168.0.77/cm?cmnd=GPIO" | python3 -m json.tool

# Template prüfen
curl -s "http://192.168.0.77/cm?cmnd=Template" | python3 -m json.tool
```

## Fehlerbehebung

### Kompilierungs-Fehler

**Problem: "Module not found"**
```bash
# PlatformIO Libraries aktualisieren
pio lib update

# Oder neu installieren
rm -rf .pio
pio run -e tasmota32s3-geek-optimized
```

**Problem: "Out of memory"**
```bash
# Stack-Größe in user_config_override.h erhöhen
#define SET_ESP32_STACK_SIZE (32 * 1024)  // Statt 24 * 1024
```

**Problem: "GPIO conflict"**
```bash
# GPIO-Template in user_config_override.h prüfen
# Sicherstellen, dass keine GPIO-Pins doppelt belegt sind
```

### TasmoCompiler-Fehler

**Problem: "Repository not available"**
- Warte einige Minuten
- Oder: Klicke auf "Clone Repository"

**Problem: "Compilation timeout"**
- Versuche erneut
- Oder: Verwende PlatformIO lokal

**Problem: "Custom parameters error"**
- Prüfe Syntax in Custom Parameters
- Entferne Zeilenumbrüche (außer \n)
- Escape-Zeichen prüfen (\")

## Größenvergleich

Nach erfolgreicher Kompilierung:

```bash
# Größen vergleichen
ls -lh tasmota32s3-*.bin

# Erwartete Werte:
# tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin:  2.1 MB
# tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin:        2.7 MB
# tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin:        1.9-2.0 MB ✅
```

## Deployment

Nach erfolgreicher Kompilierung und Verifizierung:

```bash
# 1. Firmware in Repository kopieren
cp tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin .

# 2. Git hinzufügen
git add tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin

# 3. Commit
git commit -m "Add optimized firmware v15.0.1 (1.9 MB)"

# 4. Push
git push origin tasmota-esp32s3-lvgl-v15.0.1

# 5. Deployment-Anleitung folgen
# Siehe: DEPLOYMENT_GUIDE.md
```

## Automatisierung

### Kompilierungs-Skript

```bash
#!/bin/bash
# compile_and_deploy.sh

set -e

echo "=== Tasmota Optimized Firmware Compilation ==="

# 1. Tasmota klonen
if [ ! -d "Tasmota" ]; then
    git clone https://github.com/arendst/Tasmota.git
fi

cd Tasmota
git checkout v15.0.1

# 2. Konfiguration kopieren
cp ../firmware_output/user_config_override.h tasmota/
cp ../firmware_output/platformio_override.ini .

# 3. Kompilieren
echo "Compiling..."
pio run -e tasmota32s3-geek-optimized

# 4. Firmware kopieren
FIRMWARE_NAME="tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin"
cp .pio/build/tasmota32s3-geek-optimized/firmware.bin ../$FIRMWARE_NAME

# 5. Größe prüfen
SIZE=$(stat -f%z ../$FIRMWARE_NAME 2>/dev/null || stat -c%s ../$FIRMWARE_NAME)
echo "Firmware size: $SIZE bytes (~$(($SIZE / 1024 / 1024)) MB)"

# 6. Checksum
echo "SHA256: $(sha256sum ../$FIRMWARE_NAME | cut -d' ' -f1)"

echo "✅ Compilation complete: $FIRMWARE_NAME"
```

## Zusammenfassung

**Empfohlene Methode**: TasmoCompiler Web-Interface
- Einfachste Methode
- Keine lokale Installation nötig
- Automatische Dependency-Verwaltung

**Alternative**: PlatformIO lokal
- Volle Kontrolle
- Schnellere Iteration
- Offline-Kompilierung möglich

**Ergebnis**: Optimierte Firmware
- Größe: ~1.9-2.0 MB
- Einsparung: 100-700 KB
- Alle Features erhalten
- Keine WiFi-Credentials

## Support

Bei Problemen:
1. Prüfe [FIRMWARE_OPTIMIZATION.md](FIRMWARE_OPTIMIZATION.md)
2. Prüfe [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)
3. Prüfe Tasmota Dokumentation: https://tasmota.github.io/docs/
4. Prüfe PlatformIO Dokumentation: https://docs.platformio.org/

---

**Letzte Aktualisierung**: 2026-01-10
