# Waveshare ESP32-S3-Geek Tasmota Firmware Guide

## Firmware-Informationen

### Build-Details
- **TasmoCompiler Version**: Custom Build (PlatformIO-basiert)
- **Tasmota Version**: 15.0.1
- **ESP-IDF Version**: 5.3.3.250501
- **Compile-Datum**: 2026-01-10
- **Firmware-Datei**: `tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin`
- **Größe**: 2.7 MB (2,790,044 Bytes)
- **MD5**: `0ecc46e94126d688305535f095582ef6`

### Aktivierte Features

#### Hardware-Support
- **ESP32-S3** (240 MHz, Dual-Core)
- **10x DS18x20** Temperatursensoren (1-Wire)
- **BME280** Sensor (I2C) - Temperatur, Luftfeuchtigkeit, Luftdruck
- **ST7789V Display** (240x135, SPI)
- **CST816S Touch** Controller

#### Software-Features
- **LittleFS** Filesystem (320 KB)
- **LVGL** Display-Framework (v9.3.0)
- **Berry** Scripting Engine
- **Matter/Thread** Support
- **MQTT** Client
- **Web-Interface** mit WiFi-Scan
- **OTA Updates**

### Compile-Parameter

```ini
[env:tasmota32s3]
board = esp32s3-qio_qspi
framework = arduino
platform = https://github.com/tasmota/platform-espressif32/releases/download/2025.05.30/platform-espressif32.zip

board_build.flash_mode = qio
board_build.partitions = partitions/esp32_partition_app2880k_fs320k.csv
board_build.f_cpu = 240000000L
board_build.f_flash = 80000000L

build_flags =
    -DCONFIG_TASMOTA_FLASHMODE_QIO
    -DUSE_DS18x20
    -DDS18X20_MAX_SENSORS=10
    -DUSE_BME280
    -DUSE_I2C
    -DUSE_LVGL
    -DUSE_BERRY
    -DUSE_UFILESYS
    -DSET_ESP32_STACK_SIZE=24576
```

### user_config_override.h Konfiguration

```c
// Stack size
#undef SET_ESP32_STACK_SIZE
#define SET_ESP32_STACK_SIZE (24 * 1024)

// DS18x20 sensors
#undef DS18X20_MAX_SENSORS
#define DS18X20_MAX_SENSORS 10
#define USE_DS18x20

// BME280 sensor (I2C)
#define USE_BME280
#define USE_I2C

// LittleFS support
#define USE_UFILESYS

// GPIO Template for ESP32-S3-Geek
#define USER_TEMPLATE "{\"NAME\":\"ESP32S3-Geek\",\"GPIO\":[32,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,640,608,0,0,0,0,8896,8960,8800,8832,8864,8928,0,6210,0,0,3200,3232,0,0,0,0],\"FLAG\":0,\"BASE\":1}"

// Display and Touch
#define USE_LVGL
#define USE_DISPLAY
#define USE_UNIVERSAL_DISPLAY
#define USE_UNIVERSAL_TOUCH
#define USE_CST816S

// Scripting
#define USE_BERRY
#define USE_RULES
```

---

## OTA Update Anleitung

### Firmware Download-Links

**GitHub Raw (Permanent):**
```
https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Repository-Pfad:**
```
firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

### Voraussetzungen
- Tasmota-Gerät ist im Netzwerk erreichbar
- HTTPS-Zugriff auf das Gerät (z.B. über Cloudflare Tunnel)
- Firmware-Datei lokal verfügbar ODER OTA-Server erreichbar

### Methode 1: OTA-URL (Empfohlen)

**Via Tasmota-Konsole:**
```
Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin; Upgrade 1
```

**Via curl:**
```bash
TASMOTA_IP="tasmota-XX.samharald.eu"
OTA_URL="https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"

curl -k -s "https://${TASMOTA_IP}/cm?cmnd=Backlog%20OtaUrl%20${OTA_URL};Upgrade%201"
```

**Vorteile:**
- ✅ Kein lokaler Download nötig
- ✅ Automatischer Download von GitHub
- ✅ Permanent verfügbar
- ✅ Schneller als Datei-Upload

### Methode 2: Web-Interface

1. **Firmware herunterladen** von OTA-Server
2. **Web-Interface öffnen**
   ```
   https://tasmota-XX.samharald.eu
   ```
3. **Firmware Update**
   - Menü: `Firmware Upgrade`
   - `Choose File` → Firmware-Datei auswählen
   - `Start Upgrade` klicken
   - Warten auf Upload (ca. 8-10 Sekunden)
   - Automatischer Neustart (ca. 60 Sekunden)

### Methode 3: curl-Befehl

```bash
#!/bin/bash
TASMOTA_IP="tasmota-XX.samharald.eu"
FIRMWARE="tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"

# Upload Firmware
curl -k -v \
    --connect-timeout 30 \
    --max-time 300 \
    -F "file=@${FIRMWARE}" \
    "https://${TASMOTA_IP}/u3"

# Warte auf Neustart
sleep 60

# Prüfe neue Version
curl -k -s "https://${TASMOTA_IP}/cm?cmnd=Status 2" | jq '.StatusFWR'
```

### Methode 4: Automatisches OTA-Skript

```bash
./test-ota-from-server.sh
```

Das Skript führt automatisch aus:
- OTA-Server Erreichbarkeitsprüfung
- OTA-URL setzen in Tasmota
- Update starten
- Neustart-Überwachung
- Versions-Verifikation
- BME280-Sensor-Test

---

## Konfiguration mit Setup-Skript

### WiFi-Konfiguration

```bash
#!/bin/bash
TASMOTA_IP="tasmota-XX.samharald.eu"
BASE_URL="https://${TASMOTA_IP}"

# WiFi SSID und Passwort setzen
curl -k -s "${BASE_URL}/cm?cmnd=Backlog SSID1 MeinWiFi;Password1 MeinPasswort;Restart 1"
```

### MQTT-Konfiguration

```bash
# MQTT Host, User und Passwort
MQTT_HOST="mqtt.example.com"
MQTT_USER="tasmota"
MQTT_PASS="geheim"
MQTT_TOPIC="tasmota/tasmota-XX"

curl -k -s "${BASE_URL}/cm?cmnd=Backlog MqttHost ${MQTT_HOST};MqttUser ${MQTT_USER};MqttPassword ${MQTT_PASS};Topic ${MQTT_TOPIC};Restart 1"
```

### GPIO-Konfiguration für 3x DS18x20

```bash
# GPIO 6, 13, 14 für DS18x20 (Code: 1312)
curl -k -s "${BASE_URL}/cm?cmnd=Backlog GPIO6 1312;GPIO13 1312;GPIO14 1312;Restart 1"

# Warte auf Neustart
sleep 30

# Prüfe GPIO-Konfiguration
curl -k -s "${BASE_URL}/cm?cmnd=GPIO" | jq

# Prüfe erkannte Sensoren
curl -k -s "${BASE_URL}/cm?cmnd=Status 10" | jq '.StatusSNS'
```

### BME280 I2C-Konfiguration

```bash
# I2C GPIO setzen (SDA=GPIO8, SCL=GPIO9)
curl -k -s "${BASE_URL}/cm?cmnd=Backlog GPIO8 6;GPIO9 5;Restart 1"

# Warte auf Neustart
sleep 30

# Prüfe BME280-Sensor
curl -k -s "${BASE_URL}/cm?cmnd=Status 10" | jq '.StatusSNS.BME280'
```

### Vollständiges Setup-Skript

```bash
#!/bin/bash
# setup-tasmota-XX.sh

TASMOTA_IP="tasmota-XX.samharald.eu"
BASE_URL="https://${TASMOTA_IP}"

# MQTT-Konfiguration
MQTT_HOST="mqtt.example.com"
MQTT_USER="tasmota"
MQTT_PASS="geheim"

echo "=== Tasmota Setup für ${TASMOTA_IP} ==="

# 1. WiFi konfigurieren
echo "1. WiFi-Konfiguration..."
curl -k -s "${BASE_URL}/cm?cmnd=Backlog SSID1 MeinWiFi;Password1 MeinPasswort"

# 2. MQTT konfigurieren
echo "2. MQTT-Konfiguration..."
curl -k -s "${BASE_URL}/cm?cmnd=Backlog MqttHost ${MQTT_HOST};MqttUser ${MQTT_USER};MqttPassword ${MQTT_PASS}"

# 3. GPIO für 3x DS18x20 konfigurieren
echo "3. GPIO-Konfiguration (3x DS18x20)..."
curl -k -s "${BASE_URL}/cm?cmnd=Backlog GPIO6 1312;GPIO13 1312;GPIO14 1312"

# 4. I2C für BME280 konfigurieren
echo "4. I2C-Konfiguration (BME280)..."
curl -k -s "${BASE_URL}/cm?cmnd=Backlog GPIO8 6;GPIO9 5"

# 5. TelePeriod setzen
echo "5. TelePeriod auf 60 Sekunden..."
curl -k -s "${BASE_URL}/cm?cmnd=TelePeriod 60"

# 6. WebLog aktivieren
echo "6. WebLog Level 4..."
curl -k -s "${BASE_URL}/cm?cmnd=WebLog 4"

# 7. Neustart
echo "7. Neustart..."
curl -k -s "${BASE_URL}/cm?cmnd=Restart 1"

echo "Setup abgeschlossen. Warte 30 Sekunden auf Neustart..."
sleep 30

# 8. Verifikation
echo "8. Verifikation..."
curl -k -s "${BASE_URL}/cm?cmnd=Status 10" | jq
```

---

## Datei-Upload Anleitung

### Verfügbare Dateien

1. **autoexec.be** - Berry-Autostart-Skript
2. **display.tapp** - Display-Anwendung (Berry)
3. **pages.be** - Display-Seiten-Definitionen
4. **setup.be** - Setup-Funktionen

### Upload-Methode 1: Web-Interface

1. **Filesystem öffnen**
   ```
   https://tasmota-XX.samharald.eu/u2
   ```

2. **Datei hochladen**
   - `Choose File` → Datei auswählen
   - `Upload` klicken
   - Warten auf Bestätigung

3. **Neustart**
   ```
   Console → Restart 1
   ```

### Upload-Methode 2: curl-Befehl

```bash
#!/bin/bash
TASMOTA_IP="tasmota-XX.samharald.eu"
BASE_URL="https://${TASMOTA_IP}"

# Upload autoexec.be
curl -k -F "file=@autoexec.be" "${BASE_URL}/u2"
sleep 2

# Upload display.tapp
curl -k -F "file=@display.tapp" "${BASE_URL}/u2"
sleep 2

# Upload pages.be
curl -k -F "file=@pages.be" "${BASE_URL}/u2"
sleep 2

# Upload setup.be
curl -k -F "file=@setup.be" "${BASE_URL}/u2"
sleep 2

# Neustart
curl -k -s "${BASE_URL}/cm?cmnd=Restart 1"
```

### Upload-Methode 3: Verifikations-Skript

```bash
#!/bin/bash
# upload-files-verified.sh

TASMOTA_IP="tasmota-XX.samharald.eu"
BASE_URL="https://${TASMOTA_IP}"
FILES_DIR="."

upload_and_verify() {
    local file="$1"
    local filename=$(basename "$file")
    
    echo "Upload: $filename"
    curl -k -s -F "file=@${file}" "${BASE_URL}/u2" > /tmp/upload_response.txt
    
    if grep -q "Upload Successful" /tmp/upload_response.txt; then
        echo "✅ Upload erfolgreich"
        sleep 2
        
        # Prüfe Datei-Existenz
        curl -k -s "${BASE_URL}/u2" | grep -q "$filename"
        if [ $? -eq 0 ]; then
            echo "✅ Datei existiert im Filesystem"
            return 0
        else
            echo "❌ Datei nicht gefunden!"
            return 1
        fi
    else
        echo "❌ Upload fehlgeschlagen!"
        return 1
    fi
}

# Upload alle Dateien
for file in autoexec.be display.tapp pages.be setup.be; do
    if [ -f "${FILES_DIR}/${file}" ]; then
        upload_and_verify "${FILES_DIR}/${file}"
    else
        echo "⚠️ Datei nicht gefunden: ${file}"
    fi
    echo ""
done

# Neustart
echo "Neustart..."
curl -k -s "${BASE_URL}/cm?cmnd=Restart 1"
```

---

## Beschreibung der Berry-Dateien

### autoexec.be

**Zweck**: Automatischer Start beim Boot

**Funktionen**:
- Initialisierung des Display-Systems
- Laden der Display-Anwendung
- Starten der Sensor-Überwachung
- MQTT-Integration

**Beispiel-Inhalt**:
```berry
# autoexec.be - Automatischer Start

import display
import string

# Display initialisieren
var disp = display.start()

# Display-App laden
load("display.tapp")

# Sensor-Update alle 10 Sekunden
def update_sensors()
    var sensors = tasmota.read_sensors()
    print(sensors)
end

tasmota.add_cron("*/10 * * * * *", update_sensors, "sensors")

print("autoexec.be geladen")
```

### display.tapp

**Zweck**: Display-Anwendung (kompiliertes Berry)

**Funktionen**:
- LVGL-basierte UI
- Sensor-Werte-Anzeige
- Touch-Interaktion
- Seiten-Navigation

**Kompilierung**:
```bash
# .be zu .tapp kompilieren
berry -c display.be display.tapp
```

### pages.be

**Zweck**: Display-Seiten-Definitionen

**Funktionen**:
- Seiten-Layout
- Widget-Konfiguration
- Sensor-Zuordnung
- Styling

**Beispiel-Struktur**:
```berry
# pages.be - Display-Seiten

class Page1
    var screen
    var label_temp
    var label_hum
    
    def init()
        self.screen = lv.obj()
        self.label_temp = lv.label(self.screen)
        self.label_temp.set_text("Temp: --°C")
        self.label_hum = lv.label(self.screen)
        self.label_hum.set_text("Hum: --%")
    end
    
    def update(sensors)
        if sensors.contains("BME280")
            var bme = sensors["BME280"]
            self.label_temp.set_text(string.format("Temp: %.1f°C", bme["Temperature"]))
            self.label_hum.set_text(string.format("Hum: %.1f%%", bme["Humidity"]))
        end
    end
end

return Page1
```

### setup.be

**Zweck**: Setup-Funktionen und Hilfsfunktionen

**Funktionen**:
- GPIO-Konfiguration
- Sensor-Initialisierung
- Netzwerk-Setup
- Debugging-Tools

**Beispiel-Funktionen**:
```berry
# setup.be - Setup-Funktionen

class Setup
    def configure_ds18x20()
        tasmota.cmd("GPIO6 1312")
        tasmota.cmd("GPIO13 1312")
        tasmota.cmd("GPIO14 1312")
        print("DS18x20 konfiguriert")
    end
    
    def configure_bme280()
        tasmota.cmd("GPIO8 6")  # SDA
        tasmota.cmd("GPIO9 5")  # SCL
        print("BME280 konfiguriert")
    end
    
    def show_sensors()
        var sensors = tasmota.read_sensors()
        print(sensors)
        return sensors
    end
end

return Setup
```

---

## MQTT-Anleitung

### MQTT-Konfiguration

```bash
# MQTT-Parameter setzen
curl -k -s "${BASE_URL}/cm?cmnd=Backlog \
    MqttHost mqtt.example.com; \
    MqttPort 1883; \
    MqttUser tasmota; \
    MqttPassword geheim; \
    Topic tasmota/tasmota-XX; \
    FullTopic %prefix%/%topic%/"
```

### MQTT-Topics

#### Status-Topics (Subscribe)

```
cmnd/tasmota/tasmota-XX/POWER    # Befehle empfangen
cmnd/tasmota/tasmota-XX/Status   # Status-Abfrage
```

#### Telemetrie-Topics (Publish)

```
tele/tasmota/tasmota-XX/SENSOR   # Sensor-Daten (alle 60s)
tele/tasmota/tasmota-XX/STATE    # Status-Daten (alle 300s)
stat/tasmota/tasmota-XX/RESULT   # Befehl-Antworten
```

### MQTT-Nachrichten

#### Sensor-Daten (SENSOR)

```json
{
  "Time": "2026-01-10T14:00:00",
  "DS18B20-1": {
    "Id": "00000123456789",
    "Temperature": 22.5
  },
  "DS18B20-2": {
    "Id": "00000987654321",
    "Temperature": 23.1
  },
  "DS18B20-3": {
    "Id": "00000ABCDEF012",
    "Temperature": 21.8
  },
  "BME280": {
    "Temperature": 22.3,
    "Humidity": 45.2,
    "Pressure": 1013.2
  },
  "TempUnit": "C"
}
```

#### Status-Daten (STATE)

```json
{
  "Time": "2026-01-10T14:00:00",
  "Uptime": "0T12:34:56",
  "UptimeSec": 45296,
  "Heap": 156,
  "SleepMode": "Dynamic",
  "Sleep": 50,
  "LoadAvg": 19,
  "MqttCount": 1,
  "Wifi": {
    "AP": 1,
    "SSId": "MeinWiFi",
    "BSSId": "AA:BB:CC:DD:EE:FF",
    "Channel": 6,
    "RSSI": 100,
    "Signal": -45,
    "LinkCount": 1,
    "Downtime": "0T00:00:03"
  }
}
```

### MQTT-Befehle

```bash
# Sensor-Werte abfragen
mosquitto_pub -h mqtt.example.com -u tasmota -P geheim \
    -t "cmnd/tasmota/tasmota-XX/Status" -m "10"

# GPIO-Konfiguration
mosquitto_pub -h mqtt.example.com -u tasmota -P geheim \
    -t "cmnd/tasmota/tasmota-XX/Backlog" \
    -m "GPIO6 1312;GPIO13 1312;GPIO14 1312"

# TelePeriod ändern
mosquitto_pub -h mqtt.example.com -u tasmota -P geheim \
    -t "cmnd/tasmota/tasmota-XX/TelePeriod" -m "60"
```

### MQTT-Monitoring

```bash
# Alle Topics überwachen
mosquitto_sub -h mqtt.example.com -u tasmota -P geheim \
    -t "tele/tasmota/tasmota-XX/#" -v

# Nur Sensor-Daten
mosquitto_sub -h mqtt.example.com -u tasmota -P geheim \
    -t "tele/tasmota/tasmota-XX/SENSOR" -v
```

---

## Troubleshooting

### Gerät nicht erreichbar

```bash
# Ping-Test
ping tasmota-XX.samharald.eu

# Status-Abfrage
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status"
```

### Sensoren nicht erkannt

```bash
# GPIO prüfen
curl -k -s "${BASE_URL}/cm?cmnd=GPIO" | jq

# Sensor-Status
curl -k -s "${BASE_URL}/cm?cmnd=Status 10" | jq '.StatusSNS'

# I2C-Scan
curl -k -s "${BASE_URL}/cm?cmnd=I2CScan" | jq
```

### Display zeigt nichts

```bash
# Display-Konfiguration
curl -k -s "${BASE_URL}/cm?cmnd=DisplayModel" | jq
curl -k -s "${BASE_URL}/cm?cmnd=DisplayDimmer" | jq

# Berry-Konsole
curl -k -s "${BASE_URL}/cm?cmnd=Br" | jq
```

### MQTT-Verbindung fehlgeschlagen

```bash
# MQTT-Status
curl -k -s "${BASE_URL}/cm?cmnd=Status 6" | jq '.StatusMQT'

# MQTT neu verbinden
curl -k -s "${BASE_URL}/cm?cmnd=MqttRetry"
```

---

## Support & Ressourcen

- **Tasmota Dokumentation**: [https://tasmota.github.io/docs/](https://tasmota.github.io/docs/)
- **Berry Dokumentation**: [https://tasmota.github.io/docs/Berry/](https://tasmota.github.io/docs/Berry/)
- **LVGL Dokumentation**: [https://docs.lvgl.io/](https://docs.lvgl.io/)
- **GitHub**: [https://github.com/arendst/Tasmota](https://github.com/arendst/Tasmota)

---

**Letzte Aktualisierung**: 2026-01-10
**Firmware-Version**: 15.0.1
**Hardware**: Waveshare ESP32-S3-Geek
