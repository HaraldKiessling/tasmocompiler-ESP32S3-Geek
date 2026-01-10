# Deployment-Anleitung: Optimierte Firmware für ESP32-S3-Geek

## Übersicht

Diese Anleitung beschreibt den kompletten Deployment-Prozess der optimierten Tasmota-Firmware für den ESP32-S3-Geek Stick.

## Voraussetzungen

- ESP32-S3-Geek Hardware
- Netzwerkzugang zum Gerät
- Python 3 (für Upload-Skripte)
- Oder: esptool.py (für serielle Programmierung)

## Schritt 1: Firmware kompilieren

### Option A: TasmoCompiler Web-Interface (Empfohlen)

1. **TasmoCompiler öffnen**
   ```
   https://gitpod.io/start/#benzino77-tasmocompiler
   ```

2. **Konfiguration hochladen**
   - Datei: `compile_request_optimized.json`
   - Klick auf "Upload Configuration"

3. **Kompilierung starten**
   - Klick auf "Compile"
   - Warte auf Fertigstellung (~5-10 Minuten)

4. **Firmware herunterladen**
   - Download: `firmware.bin`
   - Speichern als: `tasmota32s3-geek-optimized.bin`

### Option B: PlatformIO (Manuell)

```bash
# Tasmota Repository klonen
git clone https://github.com/arendst/Tasmota.git
cd Tasmota
git checkout v15.0.1

# Konfigurationsdateien kopieren
cp ../firmware_output/user_config_override.h tasmota/
cp ../firmware_output/platformio_override.ini .

# Kompilieren
pio run -e tasmota32s3-geek-optimized

# Firmware-Datei
ls -lh .pio/build/tasmota32s3-geek-optimized/firmware.bin
```

## Schritt 2: Firmware flashen

### Option A: OTA-Update über Web-Interface

**Für bereits laufende Tasmota-Geräte:**

1. **Web-Interface öffnen**
   ```
   http://192.168.0.77
   ```

2. **Firmware-Upgrade**
   - Menü: Firmware Upgrade
   - Datei auswählen: `tasmota32s3-geek-optimized.bin`
   - Klick: "Start Upgrade"

3. **Warten**
   - Upload: ~30 Sekunden
   - Flash: ~30 Sekunden
   - Neustart: ~10 Sekunden

4. **Verifizieren**
   ```bash
   curl -s "http://192.168.0.77/cm?cmnd=Status%202"
   ```

### Option B: Python Upload-Skript

```bash
# Firmware hochladen
python3 upload_firmware_77.py tasmota32s3-geek-optimized.bin

# Oder mit benutzerdefinierter IP
python3 upload_firmware_77.py tasmota32s3-geek-optimized.bin 192.168.0.100
```

### Option C: Serieller Flash (esptool)

**Für neue Geräte oder Wiederherstellung:**

```bash
# esptool installieren (falls nicht vorhanden)
pip install esptool

# Gerät in Flash-Modus versetzen
# - Boot-Button gedrückt halten
# - Reset-Button drücken
# - Boot-Button loslassen

# Firmware flashen
esptool.py --chip esp32s3 \
  --port /dev/ttyUSB0 \
  --baud 921600 \
  write_flash -z 0x0 tasmota32s3-geek-optimized.bin

# Gerät neustarten
esptool.py --port /dev/ttyUSB0 run
```

**Windows:**
```cmd
esptool.py --chip esp32s3 ^
  --port COM3 ^
  --baud 921600 ^
  write_flash -z 0x0 tasmota32s3-geek-optimized.bin
```

## Schritt 3: Initiale Konfiguration

### Automatische Konfiguration (Setup-Skript)

```bash
# Vollständige Konfiguration
./setup-tasmota-77.sh 192.168.0.77 "MeinWLAN" "MeinPasswort" "tasmota-sensor-01" "192.168.0.50" "mqtt_secret"

# Nur Basis-Konfiguration
./setup-tasmota-77.sh 192.168.0.77
```

Das Skript konfiguriert automatisch:
- ✅ GPIO-Template (ESP32S3-Geek)
- ✅ DS18x20 Sensoren (GPIO 6, 13, 14)
- ✅ I2C für BME280 (GPIO 16, 17)
- ✅ Display (SDIO GPIO 22-27)
- ✅ WiFi (optional)
- ✅ MQTT (optional)
- ✅ Hostname (optional)

### Manuelle Konfiguration

**1. WiFi konfigurieren**

⚠️ **Wichtig**: Die Firmware enthält keine vorkonfigurierte WiFi-Verbindung. WiFi muss nach dem ersten Flash konfiguriert werden.

```bash
curl -s "http://192.168.0.77/cm?cmnd=SSId1%20MeinWLAN"
curl -s "http://192.168.0.77/cm?cmnd=Password1%20MeinPasswort"
curl -s "http://192.168.0.77/cm?cmnd=Restart%201"
```

**2. Template prüfen**
```bash
curl -s "http://192.168.0.77/cm?cmnd=Template"
```

Sollte zeigen:
```json
{
  "NAME": "ESP32S3-Geek",
  "GPIO": [32,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,640,608,0,0,0,0,8896,8960,8800,8832,8864,8928,0,6210,0,0,3200,3232,0,0,0,0],
  "FLAG": 0,
  "BASE": 1
}
```

**3. GPIO konfigurieren (falls nötig)**
```bash
curl -s "http://192.168.0.77/cm?cmnd=GPIO6%201312"   # DS18x20
curl -s "http://192.168.0.77/cm?cmnd=GPIO13%201312"  # DS18x20
curl -s "http://192.168.0.77/cm?cmnd=GPIO14%201312"  # DS18x20
curl -s "http://192.168.0.77/cm?cmnd=Restart%201"
```

## Schritt 4: Display-Dateien hochladen

### autoexec.be und pages.jsonl

**Option A: Web-Interface**

1. **Öffne**: http://192.168.0.77
2. **Menü**: Consoles → Manage File System
3. **Upload**: `autoexec.be`
4. **Upload**: `pages.jsonl`
5. **Restart**: `curl -s "http://192.168.0.77/cm?cmnd=Restart%201"`

**Option B: Python-Skripte**

```bash
# autoexec.be hochladen
python3 upload_77_autoexec.py

# pages.jsonl hochladen
python3 upload_77_pages.py
```

**Option C: curl**

```bash
# autoexec.be
curl -F "file=@autoexec.be" http://192.168.0.77/u2

# pages.jsonl
curl -F "file=@pages.jsonl" http://192.168.0.77/u2

# Neustart
curl -s "http://192.168.0.77/cm?cmnd=Restart%201"
```

## Schritt 5: Verifizierung

### 1. Firmware-Version prüfen

```bash
curl -s "http://192.168.0.77/cm?cmnd=Status%202" | python3 -m json.tool
```

Erwartete Ausgabe:
```json
{
  "StatusFWR": {
    "Version": "15.0.1(ESP32S3-Geek-Optimized)",
    "Hardware": "ESP32-S3 v0.2"
  }
}
```

### 2. Sensoren prüfen

```bash
curl -s "http://192.168.0.77/cm?cmnd=Status%208" | python3 -m json.tool
```

Erwartete Ausgabe:
```json
{
  "StatusSNS": {
    "DS18B20-1": {
      "Id": "0000005329E2",
      "Temperature": 21.9
    },
    "DS18B20-2": {
      "Id": "00000051C76D",
      "Temperature": 22.1
    },
    "BME280": {
      "Temperature": 21.5,
      "Humidity": 45.2,
      "Pressure": 1013.2
    }
  }
}
```

### 3. GPIO-Konfiguration prüfen

```bash
curl -s "http://192.168.0.77/cm?cmnd=GPIO" | python3 -m json.tool
```

Erwartete Ausgabe:
```json
{
  "GPIO6": {"DS18x201": 1312},
  "GPIO13": {"DS18x201": 1312},
  "GPIO14": {"DS18x201": 1312}
}
```

### 4. Display prüfen

- **Visuell**: Display zeigt Sensor-Dashboard
- **Touch**: Touch-Eingabe funktioniert
- **Daten**: Sensor-Werte werden aktualisiert

### 5. Dateisystem prüfen

```bash
curl -s "http://192.168.0.77/cm?cmnd=Ufs" | python3 -m json.tool
```

Sollte zeigen:
- `autoexec.be`
- `pages.jsonl`

## Schritt 6: MQTT konfigurieren (optional)

```bash
# MQTT-Broker
curl -s "http://192.168.0.77/cm?cmnd=MqttHost%20192.168.0.50"
curl -s "http://192.168.0.77/cm?cmnd=MqttPort%201883"

# MQTT-Authentifizierung
curl -s "http://192.168.0.77/cm?cmnd=MqttUser%20tasmota"
curl -s "http://192.168.0.77/cm?cmnd=MqttPassword%20secret"

# MQTT-Topic
curl -s "http://192.168.0.77/cm?cmnd=Topic%20tasmota_sensor_01"

# Neustart
curl -s "http://192.168.0.77/cm?cmnd=Restart%201"

# MQTT-Status prüfen
curl -s "http://192.168.0.77/cm?cmnd=Status%206"
```

## Fehlerbehebung

### Problem: Firmware-Upload schlägt fehl

**Lösung 1: Freien Speicher prüfen**
```bash
curl -s "http://192.168.0.77/cm?cmnd=Status%206"
```

**Lösung 2: Dateien löschen**
```bash
# Alte Dateien löschen
curl -s "http://192.168.0.77/cm?cmnd=Delete%20old_file.bin"
```

**Lösung 3: Serieller Flash**
- Verwende esptool.py (siehe Option C oben)

### Problem: Sensoren werden nicht erkannt

**DS18B20:**
```bash
# GPIO-Konfiguration prüfen
curl -s "http://192.168.0.77/cm?cmnd=GPIO"

# GPIO neu setzen
curl -s "http://192.168.0.77/cm?cmnd=GPIO6%201312"
curl -s "http://192.168.0.77/cm?cmnd=Restart%201"

# Sensor-IDs auslesen
curl -s "http://192.168.0.77/cm?cmnd=DS18Alias"
```

**BME280:**
```bash
# I2C-Scan
curl -s "http://192.168.0.77/cm?cmnd=I2CScan"

# Sollte zeigen: 0x76 oder 0x77
```

### Problem: Display zeigt nichts

**Lösung 1: Dateien prüfen**
```bash
curl -s "http://192.168.0.77/cm?cmnd=Ufs"
```

**Lösung 2: Dateien neu hochladen**
```bash
python3 upload_77_autoexec.py
python3 upload_77_pages.py
curl -s "http://192.168.0.77/cm?cmnd=Restart%201"
```

**Lösung 3: Berry-Console prüfen**
- Web-Interface → Consoles → Berry Scripting
- Fehler-Meldungen prüfen

### Problem: WiFi-Verbindung fehlgeschlagen

⚠️ **Hinweis**: Die Firmware enthält keine vorkonfigurierte WiFi-Verbindung. Nach dem ersten Flash startet das Gerät automatisch im AP-Modus.

**Lösung 1: AP-Modus (Standard nach erstem Flash)**
- Gerät startet automatisch als Access Point
- Mit AP verbinden: `tasmota-XXXXXX` (Passwort: siehe Display oder Dokumentation)
- Browser öffnen: `http://192.168.4.1`
- WiFi manuell konfigurieren

**Lösung 2: AP-Modus manuell aktivieren**
- Boot-Button 6 Sekunden halten
- Mit AP verbinden: `tasmota-XXXXXX`
- Browser öffnen: `http://192.168.4.1`
- WiFi manuell konfigurieren

**Lösung 2: Seriell konfigurieren**
```bash
# Serielle Konsole öffnen
screen /dev/ttyUSB0 115200

# Befehle eingeben
SSId1 MeinWLAN
Password1 MeinPasswort
Restart 1
```

## Backup und Wiederherstellung

### Backup erstellen

```bash
# Vollständige Konfiguration
curl -s "http://192.168.0.77/dl" > tasmota-backup-$(date +%Y%m%d).dmp

# Nur Einstellungen
curl -s "http://192.168.0.77/cm?cmnd=Status%200" > config-backup-$(date +%Y%m%d).json

# Dateisystem-Dateien
curl -s "http://192.168.0.77/autoexec.be" > autoexec-backup.be
curl -s "http://192.168.0.77/pages.jsonl" > pages-backup.jsonl
```

### Backup wiederherstellen

**Via Web-Interface:**
1. Configuration → Restore Configuration
2. Datei auswählen: `tasmota-backup-YYYYMMDD.dmp`
3. Upload und Neustart

**Via Befehl:**
```bash
curl -F "file=@tasmota-backup-20260110.dmp" http://192.168.0.77/u3
```

## Rollout auf mehrere Geräte

### Skript für Massen-Deployment

```bash
#!/bin/bash
# deploy_all.sh - Deploy optimierte Firmware auf mehrere Geräte

DEVICES=(
    "192.168.0.77"
    "192.168.0.78"
    "192.168.0.79"
)

FIRMWARE="tasmota32s3-geek-optimized.bin"
WIFI_SSID="MeinWLAN"
WIFI_PASS="MeinPasswort"
MQTT_HOST="192.168.0.50"
MQTT_PASS="mqtt_secret"

for IP in "${DEVICES[@]}"; do
    echo "=========================================="
    echo "Deploying to: $IP"
    echo "=========================================="
    
    # Firmware flashen
    python3 upload_firmware_77.py "$FIRMWARE" "$IP"
    sleep 60  # Warten auf Neustart
    
    # Konfigurieren
    ./setup-tasmota-77.sh "$IP" "$WIFI_SSID" "$WIFI_PASS" "tasmota-$IP" "$MQTT_HOST" "$MQTT_PASS"
    sleep 30
    
    # Display-Dateien hochladen
    curl -F "file=@autoexec.be" "http://$IP/u2"
    curl -F "file=@pages.jsonl" "http://$IP/u2"
    curl -s "http://$IP/cm?cmnd=Restart%201"
    
    echo "✅ Deployment complete: $IP"
    echo ""
done

echo "=========================================="
echo "✅ All devices deployed!"
echo "=========================================="
```

## Monitoring

### Status-Check-Skript

```bash
#!/bin/bash
# check_status.sh - Prüfe Status aller Geräte

DEVICES=(
    "192.168.0.77"
    "192.168.0.78"
    "192.168.0.79"
)

for IP in "${DEVICES[@]}"; do
    echo "Device: $IP"
    
    # Firmware-Version
    VERSION=$(curl -s "http://$IP/cm?cmnd=Status%202" | python3 -c "import sys, json; print(json.load(sys.stdin)['StatusFWR']['Version'])")
    echo "  Version: $VERSION"
    
    # Uptime
    UPTIME=$(curl -s "http://$IP/cm?cmnd=Status%2011" | python3 -c "import sys, json; print(json.load(sys.stdin)['StatusSTS']['Uptime'])")
    echo "  Uptime: $UPTIME"
    
    # Sensoren
    SENSORS=$(curl -s "http://$IP/cm?cmnd=Status%208" | python3 -c "import sys, json; d=json.load(sys.stdin)['StatusSNS']; print(len([k for k in d.keys() if 'DS18' in k or 'BME' in k]))")
    echo "  Sensors: $SENSORS"
    
    echo ""
done
```

## Zusammenfassung

**Deployment-Schritte:**
1. ✅ Firmware kompilieren (TasmoCompiler oder PlatformIO)
2. ✅ Firmware flashen (OTA, Python-Skript oder esptool)
3. ✅ Konfiguration durchführen (setup-tasmota-77.sh)
4. ✅ Display-Dateien hochladen (autoexec.be, pages.jsonl)
5. ✅ Verifizierung (Firmware, Sensoren, Display)
6. ✅ MQTT konfigurieren (optional)

**Erwartete Ergebnisse:**
- Firmware-Größe: ~1.9-2.0 MB (vs 2.1-2.7 MB)
- Boot-Zeit: ~4-6 Sekunden (vs 5-8 Sekunden)
- Alle Funktionen: Vollständig erhalten
- Display: Funktioniert mit allen Sensoren

**Support:**
- FIRMWARE_OPTIMIZATION.md - Optimierungs-Details
- SETUP_TASMOTA_77.md - Setup-Anleitung
- DISPLAY_CONFIG.md - Display-Konfiguration
- https://tasmota.github.io/docs/ - Tasmota-Dokumentation
