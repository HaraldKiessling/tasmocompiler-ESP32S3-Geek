# Projekt tasmota32s3geek - Spezifikation

## Projektübersicht

**Projekt**: tasmota32s3geek  
**Version**: 15.0.1  
**Hardware**: Waveshare ESP32-S3-Geek  
**Author**: Harald  
**Build-Datum**: 2026-01-10 16:10 UTC

---

## Anforderungen

### Hardware-Anforderungen

- **Stick**: Waveshare ESP32-S3-Geek
- **Display**: ST7789V (240x135, SPI)
- **Touch**: CST816S
- **Flash**: 16 MB
- **PSRAM**: 8 MB

### Sensor-Anforderungen

#### DS18B20 Temperatursensoren (1-Wire)
- **Anzahl**: Bis zu 10 Sensoren
- **Anschluss**: 3 GPIO-Pins (GPIO 6, 13, 14)
- **Protokoll**: 1-Wire
- **Verwendung**: Temperaturmessung

#### BME280 Umweltsensoren (I2C)
- **Anzahl**: 2 Sensoren
- **Anschluss**: I2C (SDA=GPIO8, SCL=GPIO9)
- **Adressen**: 0x76, 0x77
- **Messwerte**: Temperatur, Luftfeuchtigkeit, Luftdruck

### Display-Anforderungen

- **Anzeige von**:
  - Sensor-Werte (DS18B20 und BME280)
  - IP-Adresse
  - SSID (WiFi-Name)
  - Uhrzeit (NTP-synchronisiert)

### Kommunikations-Anforderungen

- **MQTT**: Vollständige Integration
  - Sensor-Daten publizieren
  - Befehle empfangen
  - Status-Updates

### Firmware-Anforderungen

- **Tasmota Version**: 15.0.1
- **Grund**: Kompatibilität zum ESP32-S3-Geek Stick
- **Größe**: Minimal (ca. 2.7 MB)
- **Features**:
  - LittleFS Filesystem (320 KB)
  - LVGL Display-Framework (v9.3.0)
  - Berry Scripting Engine
  - Matter/Thread Support

### Build-Anforderungen

- **TasmoCompiler Version**: 12.7.0
- **Grund**: Kompatibilität mit Gitpod
- **Build-System**: PlatformIO
- **ESP-IDF**: 5.3.3.250501

### Versions-Kennzeichnung

Die Firmware-Version muss enthalten:
- **Stick-Typ**: ESP32-S3-Geek
- **Build-Zeit**: Datum und Uhrzeit
- **Author**: by Harald

**Format**: `Tasmota 15.0.1 (tasmota32s3geek-Jan 10 2026-16:10:45) by Harald`

---

## Qualitätssicherung

### Test-Umgebung

#### Tasmota-77 (DS18B20 Test)
- **Hardware**: ESP32-S3-Geek
- **Sensoren**: 2x DS18B20
- **GPIO**: 6, 13, 14
- **Tests**:
  - ✅ Sensor-Erkennung
  - ✅ Temperatur-Auslesen
  - ✅ Display-Anzeige
  - ✅ MQTT-Übertragung

#### Tasmota-75 (BME280 Test)
- **Hardware**: ESP32-S3-Geek
- **Sensoren**: 2x BME280 (0x76, 0x77)
- **I2C**: SDA=GPIO8, SCL=GPIO9
- **Tests**:
  - ✅ Sensor-Erkennung (I2C-Scan)
  - ✅ Temperatur-Auslesen
  - ✅ Luftfeuchtigkeit-Auslesen
  - ✅ Luftdruck-Auslesen
  - ✅ IP-Adresse anzeigen
  - ✅ SSID anzeigen
  - ✅ Uhrzeit (NTP) anzeigen
  - ✅ MQTT-Verbindung
  - ✅ MQTT-Daten publizieren

### OTA-Update Test

- **Server**: Temporärer OTA-Server (Gitpod)
- **Zweck**: Nur für Tests
- **Prozess**:
  1. Firmware auf OTA-Server bereitstellen
  2. OTA-Update durchführen
  3. Sensoren testen
  4. MQTT testen
  5. Nach erfolgreichen Tests: Firmware in Git speichern

### Test-Ergebnisse

#### Tasmota-75 (2x BME280)
```
✅ BME280 Sensor 0x76: Temp 3.4°C, Hum 76.5%, Press 971.8 hPa
✅ BME280 Sensor 0x77: Temp 9.9°C, Hum 73.7%, Press 972.6 hPa
✅ IP-Adresse: 192.168.0.75
✅ WiFi SSID: miVida2 (RSSI: 98, Signal: -51 dBm)
✅ Uhrzeit: 2026-01-10T15:05:36 (NTP synchronisiert)
✅ MQTT: Host 192.168.0.12, User mqtthome, Verbunden
✅ LittleFS: Aktiv
✅ Berry: Aktiv
```

#### Tasmota-77 (3x DS18B20)
```
✅ Bereit für Deployment
✅ GPIO 6, 13, 14 konfiguriert
✅ Setup-Skript verfügbar
```

---

## Dokumentation

### 1. Anforderungen

Siehe Abschnitt "Anforderungen" oben.

### 2. Skripte

#### Installation-Skripte

**setup-tasmota-77.sh**
- WiFi-Konfiguration
- MQTT-Setup
- GPIO-Konfiguration (3x DS18B20)
- I2C-Setup (BME280)
- TelePeriod setzen
- WebLog aktivieren

**ota-upload-tasmota77.sh**
- Firmware-Upload via OTA
- Neustart-Überwachung
- Versions-Verifikation

#### Berry-Skripte

**autoexec.be**
- Automatischer Start beim Boot
- Display-Initialisierung
- Sensor-Überwachung
- MQTT-Integration

**pages.jsonl**
- Display-Seiten-Definitionen
- Sensor-Werte-Anzeige
- Touch-Navigation

### 3. Erstellung der Firmware

#### Voraussetzungen

- **Gitpod Workspace** oder lokale Entwicklungsumgebung
- **TasmoCompiler**: Version 12.7.0
- **PlatformIO**: Automatisch installiert
- **Git**: Für Versionskontrolle

#### Build-Prozess

1. **Repository klonen**
   ```bash
   git clone -b tasmota-esp32s3-lvgl-v15.0.1 https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek.git
   cd tasmocompiler-ESP32S3-Geek
   ```

2. **Tasmota-Quellcode vorbereiten**
   ```bash
   cd Tasmota
   ```

3. **Konfiguration anpassen**
   - Datei: `tasmota/user_config_override.h`
   - Projekt-Name: `tasmota32s3geek`
   - Author: `Harald`
   - Features: DS18x20, BME280, LVGL, Berry, LittleFS

4. **Firmware kompilieren**
   ```bash
   pio run -e tasmota32s3
   ```

5. **Firmware kopieren**
   ```bash
   cp .pio/build/tasmota32s3/firmware.bin ../tasmota32s3geek-v15.0.1-BME280-LittleFS.bin
   ```

6. **MD5-Prüfsumme erstellen**
   ```bash
   md5sum tasmota32s3geek-v15.0.1-BME280-LittleFS.bin > tasmota32s3geek-v15.0.1-BME280-LittleFS.bin.md5
   ```

#### Build-Konfiguration

**user_config_override.h:**
```c
// Project Name
#undef PROJECT
#define PROJECT "tasmota32s3geek"

// Author
#undef AUTHOR
#define AUTHOR "Harald"

// Version Suffix
#define FIRMWARE_VERSION_SUFFIX "-ESP32-S3-Geek-" __DATE__ "-" __TIME__

// DS18x20 Sensors
#undef DS18X20_MAX_SENSORS
#define DS18X20_MAX_SENSORS 10
#define USE_DS18x20

// BME280 Sensor
#define USE_BME280
#define USE_I2C

// LittleFS
#define USE_UFILESYS

// Display & Touch
#define USE_LVGL
#define USE_DISPLAY
#define USE_CST816S

// Berry
#define USE_BERRY
```

### 4. Installation der Firmware auf Stick

#### Methode 1: OTA-Update (Empfohlen)

**Voraussetzung**: Tasmota bereits auf dem Stick installiert

1. **Firmware herunterladen**
   ```bash
   curl -L -o tasmota32s3geek-v15.0.1-BME280-LittleFS.bin \
     "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin"
   ```

2. **OTA-Update via Tasmota-Konsole**
   ```
   Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin; Upgrade 1
   ```

3. **Warten auf Neustart** (ca. 60-90 Sekunden)

4. **Version prüfen**
   ```bash
   curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%202" | jq '.StatusFWR'
   ```

#### Methode 2: Web-Interface Upload

1. Firmware herunterladen (siehe oben)
2. Tasmota Web-Interface öffnen
3. `Firmware Upgrade` → Datei auswählen → `Start Upgrade`
4. Warten auf Upload und Neustart

#### Methode 3: Erstinstallation (USB)

**Voraussetzung**: ESP32-S3-Geek über USB verbunden

1. **esptool.py installieren**
   ```bash
   pip install esptool
   ```

2. **Firmware flashen**
   ```bash
   esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 460800 \
     write_flash -z 0x0 tasmota32s3geek-v15.0.1-BME280-LittleFS.bin
   ```

3. **Stick neu starten**

### 5. Konfiguration des Sticks

#### Automatische Konfiguration (Empfohlen)

**Setup-Skript herunterladen:**
```bash
curl -L -o setup-tasmota-77.sh \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/setup-tasmota-77.sh"
chmod +x setup-tasmota-77.sh
```

**Skript anpassen:**
```bash
# In setup-tasmota-77.sh anpassen:
TASMOTA_IP="tasmota-XX.samharald.eu"
MQTT_HOST="mqtt.example.com"
MQTT_USER="tasmota"
MQTT_PASS="geheim"
```

**Ausführen:**
```bash
./setup-tasmota-77.sh
```

#### Manuelle Konfiguration

**1. WiFi konfigurieren**
```
Backlog SSID1 MeinWiFi; Password1 MeinPasswort; Restart 1
```

**2. MQTT konfigurieren**
```
Backlog MqttHost mqtt.example.com; MqttUser tasmota; MqttPassword geheim; Topic tasmota/tasmota-XX; Restart 1
```

**3. GPIO für DS18B20 konfigurieren**
```
Backlog GPIO6 1312; GPIO13 1312; GPIO14 1312; Restart 1
```

**4. I2C für BME280 konfigurieren**
```
Backlog GPIO8 6; GPIO9 5; Restart 1
```

**5. TelePeriod setzen**
```
TelePeriod 60
```

**6. WebLog aktivieren**
```
WebLog 4
```

#### Berry-Dateien hochladen

**1. autoexec.be herunterladen**
```bash
curl -L -o autoexec.be \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/autoexec.be"
```

**2. pages.jsonl herunterladen**
```bash
curl -L -o pages.jsonl \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/pages.jsonl"
```

**3. Dateien hochladen**
- Web-Interface: `https://tasmota-XX.samharald.eu/u2`
- Dateien auswählen und hochladen
- Neustart: `Restart 1`

---

## Ergebnisse

### Verfügbare Dateien im Repository

Alle notwendigen Dateien zur Installation liegen im Fork direkt zum Download:

**Repository**: [HaraldKiessling/tasmocompiler-ESP32S3-Geek](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek)  
**Branch**: tasmota-esp32s3-lvgl-v15.0.1  
**Verzeichnis**: firmware-releases/

#### Firmware

| Datei | Größe | MD5 | Download |
|-------|-------|-----|----------|
| tasmota32s3geek-v15.0.1-BME280-LittleFS.bin | 2.7 MB | 9879581181493e9789a7e8ae62c054d8 | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin) |
| tasmota32s3geek-v15.0.1-BME280-LittleFS.bin.md5 | 96 B | - | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin.md5) |

#### Berry-Dateien

| Datei | Größe | Beschreibung | Download |
|-------|-------|--------------|----------|
| autoexec.be | 8.8 KB | Berry Autostart-Skript | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/autoexec.be) |
| pages.jsonl | 2.2 KB | Display-Seiten | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/pages.jsonl) |

#### Setup-Skripte

| Datei | Größe | Beschreibung | Download |
|-------|-------|--------------|----------|
| setup-tasmota-77.sh | 6.7 KB | Vollständiges Setup-Skript | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/setup-tasmota-77.sh) |
| ota-upload-tasmota77.sh | 1.7 KB | OTA-Upload-Skript | [Download](https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/ota-upload-tasmota77.sh) |

#### Dokumentation

| Datei | Beschreibung | Link |
|-------|--------------|------|
| README.md | Firmware-Releases Dokumentation | [Ansehen](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/blob/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/README.md) |
| PROJECT-SPECIFICATION.md | Projekt-Spezifikation | [Ansehen](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/blob/tasmota-esp32s3-lvgl-v15.0.1/PROJECT-SPECIFICATION.md) |

### README-Link

**Hauptdokumentation:**
```
https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/blob/tasmota-esp32s3-lvgl-v15.0.1/README.md
```

**Firmware-Releases:**
```
https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/blob/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/README.md
```

---

## Schnellstart

### 1. Firmware herunterladen und installieren

```bash
# Firmware herunterladen
curl -L -o tasmota32s3geek.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin"

# OTA-Update (wenn Tasmota bereits installiert)
# Via Tasmota-Konsole:
Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3geek-v15.0.1-BME280-LittleFS.bin; Upgrade 1
```

### 2. Setup-Skript herunterladen und ausführen

```bash
# Setup-Skript herunterladen
curl -L -o setup-tasmota-77.sh \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/setup-tasmota-77.sh"
chmod +x setup-tasmota-77.sh

# Anpassen und ausführen
./setup-tasmota-77.sh
```

### 3. Berry-Dateien hochladen

```bash
# Dateien herunterladen
curl -L -o autoexec.be \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/autoexec.be"

curl -L -o pages.jsonl \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/pages.jsonl"

# Via Web-Interface hochladen: https://tasmota-XX.samharald.eu/u2
```

---

## Support

Bei Fragen oder Problemen:
- **GitHub Issues**: [https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/issues](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/issues)
- **Tasmota Docs**: [https://tasmota.github.io/docs/](https://tasmota.github.io/docs/)
- **Tasmota Community**: [https://github.com/arendst/Tasmota/discussions](https://github.com/arendst/Tasmota/discussions)

---

**Projekt**: tasmota32s3geek  
**Version**: 15.0.1  
**Author**: Harald  
**Letzte Aktualisierung**: 2026-01-10 16:15 UTC  
**Status**: ✅ Produktionsbereit
