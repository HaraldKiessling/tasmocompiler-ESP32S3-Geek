# Tasmota ESP32-S3-Geek Firmware - Direkte Download-Links

## Firmware-Informationen

**Version**: Tasmota 15.0.1  
**Build-Datum**: 2026-01-10 13:52 UTC  
**Dateiname**: `tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin`  
**Größe**: 2.7 MB (2,790,256 Bytes)  
**MD5**: `0ecc46e94126d688305535f095582ef6`  
**Hardware**: Waveshare ESP32-S3-Geek

---

## 📥 Direkte Download-Links

### 1. GitHub Raw (Empfohlen - Permanent verfügbar)

**Direkter Firmware-Download:**
```
https://raw.githubusercontent.com/benzino77/tasmocompiler/main/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Download via curl:**
```bash
curl -L -o tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin \
  "https://raw.githubusercontent.com/benzino77/tasmocompiler/main/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
```

**Download via wget:**
```bash
wget https://raw.githubusercontent.com/benzino77/tasmocompiler/main/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**MD5-Datei herunterladen:**
```bash
curl -L -o tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin.md5 \
  "https://raw.githubusercontent.com/benzino77/tasmocompiler/main/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin.md5"
```

### 2. Repository-Pfad

**Relativer Pfad im Repository:**
```
firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Lokaler Pfad (nach git clone):**
```bash
git clone https://github.com/benzino77/tasmocompiler.git
cd tasmocompiler/firmware-releases
ls -lh tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

---

## 🔗 QR-Code für Mobile Download

Erstelle einen QR-Code für den direkten Download:

```bash
# QR-Code generieren (benötigt qrencode)
echo "https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin" | qrencode -t UTF8
```

Oder nutze einen Online-QR-Generator:
- [https://www.qr-code-generator.com/](https://www.qr-code-generator.com/)
- [https://goqr.me/](https://goqr.me/)

---

## 📋 Download-Verifikation

### MD5-Prüfsumme verifizieren

**Linux/macOS:**
```bash
md5sum tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Windows (PowerShell):**
```powershell
Get-FileHash -Algorithm MD5 tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Erwartete MD5:**
```
0ecc46e94126d688305535f095582ef6
```

### Datei-Integrität prüfen

**Dateigröße prüfen:**
```bash
ls -lh tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
# Erwartete Größe: 2.7M (2,790,256 Bytes)
```

**Datei-Typ prüfen:**
```bash
file tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
# Erwartete Ausgabe: ESP-IDF application image for ESP32-S3
```

---

## 🌐 Alternative Download-Methoden

### 1. Browser-Download

Öffne im Browser:
```
https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev
```

Klicke auf **"⬇️ Firmware herunterladen"**

### 2. Download-Manager

**aria2c (schneller Multi-Thread Download):**
```bash
aria2c -x 4 https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**axel (Multi-Connection Download):**
```bash
axel -n 4 https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

### 3. Python Download-Skript

```python
#!/usr/bin/env python3
import requests

url = "https://raw.githubusercontent.com/benzino77/tasmocompiler/main/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
filename = "tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"

print(f"Downloading {filename}...")
response = requests.get(url, stream=True)
total_size = int(response.headers.get('content-length', 0))

with open(filename, 'wb') as f:
    downloaded = 0
    for chunk in response.iter_content(chunk_size=8192):
        if chunk:
            f.write(chunk)
            downloaded += len(chunk)
            progress = (downloaded / total_size) * 100
            print(f"\rProgress: {progress:.1f}%", end='')

print("\nDownload complete!")
```

---

## 📦 Batch-Download für mehrere Geräte

### Download-Skript für mehrere Kopien

```bash
#!/bin/bash
# download-firmware-batch.sh

FIRMWARE_URL="https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
FIRMWARE_NAME="tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
DOWNLOAD_DIR="firmware-downloads"

# Erstelle Download-Verzeichnis
mkdir -p "$DOWNLOAD_DIR"

# Download Firmware
echo "Downloading firmware..."
curl -o "$DOWNLOAD_DIR/$FIRMWARE_NAME" "$FIRMWARE_URL"

# Verifiziere Download
if [ -f "$DOWNLOAD_DIR/$FIRMWARE_NAME" ]; then
    echo "✅ Download erfolgreich"
    
    # MD5-Prüfsumme
    echo "MD5: $(md5sum "$DOWNLOAD_DIR/$FIRMWARE_NAME" | awk '{print $1}')"
    
    # Dateigröße
    echo "Größe: $(ls -lh "$DOWNLOAD_DIR/$FIRMWARE_NAME" | awk '{print $5}')"
    
    # Erstelle Kopien für mehrere Geräte
    for i in {1..5}; do
        cp "$DOWNLOAD_DIR/$FIRMWARE_NAME" "$DOWNLOAD_DIR/tasmota-device-$i.bin"
        echo "Kopie erstellt: tasmota-device-$i.bin"
    done
else
    echo "❌ Download fehlgeschlagen"
    exit 1
fi
```

---

## 🔄 OTA-Update direkt nach Download

### Automatisches OTA-Update nach Download

```bash
#!/bin/bash
# download-and-ota.sh

FIRMWARE_URL="https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
FIRMWARE_NAME="tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
TASMOTA_IP="tasmota-XX.samharald.eu"

# Download Firmware
echo "1. Downloading firmware..."
curl -o "$FIRMWARE_NAME" "$FIRMWARE_URL"

# Verifiziere Download
if [ ! -f "$FIRMWARE_NAME" ]; then
    echo "❌ Download fehlgeschlagen"
    exit 1
fi

echo "✅ Download erfolgreich"
echo "MD5: $(md5sum "$FIRMWARE_NAME" | awk '{print $1}')"

# OTA-Upload
echo ""
echo "2. Starte OTA-Upload zu $TASMOTA_IP..."
curl -k -F "file=@${FIRMWARE_NAME}" "https://${TASMOTA_IP}/u3"

echo ""
echo "3. Warte auf Neustart (60 Sekunden)..."
sleep 60

# Verifiziere neue Version
echo ""
echo "4. Prüfe neue Version:"
curl -k -s "https://${TASMOTA_IP}/cm?cmnd=Status%202" | jq '.StatusFWR'
```

---

## 📊 Download-Statistiken

### Firmware-Größe nach Kompression

**Unkomprimiert:**
```
2,790,256 Bytes (2.7 MB)
```

**gzip-komprimiert:**
```bash
gzip -k tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
ls -lh tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin.gz
# Erwartete Größe: ~1.8 MB (35% Kompression)
```

**zip-komprimiert:**
```bash
zip tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.zip tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
ls -lh tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.zip
# Erwartete Größe: ~1.8 MB
```

### Download-Zeiten (geschätzt)

| Verbindung | Geschwindigkeit | Download-Zeit |
|------------|-----------------|---------------|
| 1 Mbit/s | 125 KB/s | ~22 Sekunden |
| 10 Mbit/s | 1.25 MB/s | ~2 Sekunden |
| 100 Mbit/s | 12.5 MB/s | <1 Sekunde |
| 1 Gbit/s | 125 MB/s | <1 Sekunde |

---

## 🔐 Sichere Download-Verifikation

### Vollständige Verifikation

```bash
#!/bin/bash
# verify-firmware.sh

FIRMWARE="tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
EXPECTED_MD5="0ecc46e94126d688305535f095582ef6"
EXPECTED_SIZE="2790256"

echo "=== Firmware-Verifikation ==="
echo ""

# 1. Datei existiert?
if [ ! -f "$FIRMWARE" ]; then
    echo "❌ Firmware-Datei nicht gefunden: $FIRMWARE"
    exit 1
fi
echo "✅ Datei existiert"

# 2. Dateigröße prüfen
ACTUAL_SIZE=$(stat -c%s "$FIRMWARE" 2>/dev/null || stat -f%z "$FIRMWARE" 2>/dev/null)
if [ "$ACTUAL_SIZE" -eq "$EXPECTED_SIZE" ]; then
    echo "✅ Dateigröße korrekt: $ACTUAL_SIZE Bytes"
else
    echo "❌ Dateigröße falsch: $ACTUAL_SIZE Bytes (erwartet: $EXPECTED_SIZE)"
    exit 1
fi

# 3. MD5-Prüfsumme
ACTUAL_MD5=$(md5sum "$FIRMWARE" | awk '{print $1}')
if [ "$ACTUAL_MD5" = "$EXPECTED_MD5" ]; then
    echo "✅ MD5-Prüfsumme korrekt: $ACTUAL_MD5"
else
    echo "❌ MD5-Prüfsumme falsch: $ACTUAL_MD5 (erwartet: $EXPECTED_MD5)"
    exit 1
fi

# 4. Datei-Typ prüfen
FILE_TYPE=$(file "$FIRMWARE" | grep -o "ESP32-S3")
if [ ! -z "$FILE_TYPE" ]; then
    echo "✅ Datei-Typ korrekt: ESP32-S3 Firmware"
else
    echo "❌ Datei-Typ falsch"
    exit 1
fi

echo ""
echo "=== ✅ Alle Verifikationen erfolgreich ==="
```

---

## 📱 Mobile Download-Anleitung

### Android

1. Öffne Chrome/Firefox
2. Navigiere zu: `https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev`
3. Tippe auf "Firmware herunterladen"
4. Datei wird in Downloads gespeichert
5. Nutze USB-OTG oder Cloud-Upload für Transfer

### iOS

1. Öffne Safari
2. Navigiere zu: `https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev`
3. Tippe auf "Firmware herunterladen"
4. Wähle "In Dateien speichern"
5. Nutze AirDrop oder iCloud für Transfer

---

## 🌍 Mirror-Links (für Backup)

### Eigenen Mirror erstellen

```bash
#!/bin/bash
# create-mirror.sh

FIRMWARE="tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"
MIRROR_DIR="/var/www/html/firmware"

# Erstelle Mirror-Verzeichnis
sudo mkdir -p "$MIRROR_DIR"

# Kopiere Firmware
sudo cp "$FIRMWARE" "$MIRROR_DIR/"

# Erstelle MD5-Datei
md5sum "$FIRMWARE" | sudo tee "$MIRROR_DIR/$FIRMWARE.md5"

# Erstelle Info-Datei
cat << EOF | sudo tee "$MIRROR_DIR/info.txt"
Firmware: $FIRMWARE
Version: 15.0.1
Build-Datum: 2026-01-10 13:52 UTC
Größe: 2,790,256 Bytes
MD5: 0ecc46e94126d688305535f095582ef6
Hardware: Waveshare ESP32-S3-Geek
EOF

echo "✅ Mirror erstellt in: $MIRROR_DIR"
```

---

## 📞 Support & Hilfe

Bei Download-Problemen:

1. **Prüfe Internetverbindung**
   ```bash
   ping -c 4 8.8.8.8
   ```

2. **Prüfe OTA-Server Erreichbarkeit**
   ```bash
   curl -I https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev
   ```

3. **Nutze alternativen Download-Weg**
   - Lokaler Pfad im Gitpod Workspace
   - Browser-Download statt curl/wget
   - Download-Manager mit Resume-Funktion

4. **Kontaktiere Support**
   - GitHub Issues
   - Tasmota Community Forum
   - Discord/Telegram Gruppen

---

## 🔗 Alle Download-Links auf einen Blick

| Methode | Link |
|---------|------|
| **Web-Interface** | [https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev](https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev) |
| **Direkter Download** | [https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin](https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin) |
| **Lokaler Pfad** | `/workspaces/tasmocompiler/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin` |
| **OTA-Server Pfad** | `/workspaces/tasmocompiler/ota-server/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin` |

---

**Letzte Aktualisierung**: 2026-01-10 15:10 UTC  
**Firmware-Version**: 15.0.1  
**Status**: ✅ Download-Links aktiv und getestet
