# Tasmota-77 Setup Script Dokumentation

## Übersicht

Das `setup-tasmota-77.sh` Skript konfiguriert ein Tasmota ESP32-S3 Gerät mit den Einstellungen des Referenzgeräts tasmota-77.samharald.eu. Das Skript unterstützt flexible Parametrisierung für WiFi, Hostname und MQTT-Konfiguration.

## Hardware

- **Mikrocontroller**: ESP32-S3 v0.2
- **Flash**: 16 MB
- **Sensoren**:
  - Bis zu 10x DS18B20 Temperatursensoren (OneWire)
  - BME280 (Temperatur, Luftfeuchtigkeit, Luftdruck via I2C)
- **Display**: LVGL-basiertes Touch-Display
- **Firmware**: Tasmota 15.0.1 (ESP32S3-Matter-HA-BME280)

## Verwendung

### Syntax

```bash
./setup-tasmota-77.sh [DEVICE_IP] [WIFI_SSID] [WIFI_PASSWORD] [HOSTNAME] [MQTT_HOST] [MQTT_PASSWORD]
```

### Parameter

| Parameter | Position | Beschreibung | Pflicht | Standard |
|-----------|----------|--------------|---------|----------|
| `DEVICE_IP` | 1 | IP-Adresse des Tasmota-Geräts | Nein | 192.168.0.77 |
| `WIFI_SSID` | 2 | WiFi-Netzwerkname | Nein | - |
| `WIFI_PASSWORD` | 3 | WiFi-Passwort | Nein | - |
| `HOSTNAME` | 4 | Gerät-Hostname | Nein | tasmota-C6D100-4352 |
| `MQTT_HOST` | 5 | MQTT-Broker IP/Hostname | Nein | - |
| `MQTT_PASSWORD` | 6 | MQTT-Broker Passwort | Nein | - |

**Wichtig**: Wenn ein Parameter nicht übergeben wird, wird die entsprechende Einstellung **nicht geändert**. Das Gerät behält seine aktuelle Konfiguration.

### Beispiele

#### 1. Minimale Konfiguration (nur Basis-Einstellungen)
```bash
./setup-tasmota-77.sh 192.168.0.100
```
Konfiguriert nur Gerätenamen, Topic und Standard-Einstellungen. WiFi und MQTT bleiben unverändert.

#### 2. WiFi konfigurieren
```bash
./setup-tasmota-77.sh 192.168.0.100 "MeinWLAN" "MeinPasswort"
```
Setzt WiFi-Zugangsdaten. Hostname und MQTT bleiben unverändert.

#### 3. WiFi und Hostname
```bash
./setup-tasmota-77.sh 192.168.0.100 "MeinWLAN" "MeinPasswort" "tasmota-wohnzimmer"
```
Konfiguriert WiFi und setzt einen benutzerdefinierten Hostname.

#### 4. Vollständige Konfiguration mit MQTT
```bash
./setup-tasmota-77.sh 192.168.0.100 "MeinWLAN" "MeinPasswort" "tasmota-wohnzimmer" "192.168.0.50"
```
Konfiguriert alle Parameter inklusive MQTT-Broker (ohne Passwort).

#### 5. MQTT mit Passwort
```bash
./setup-tasmota-77.sh 192.168.0.100 "MeinWLAN" "MeinPasswort" "tasmota-wohnzimmer" "192.168.0.50" "mqtt_secret"
```
Vollständige Konfiguration inklusive MQTT-Broker mit Authentifizierung.

#### 6. Nur MQTT ändern (WiFi beibehalten)
```bash
./setup-tasmota-77.sh 192.168.0.100 "" "" "" "192.168.0.50" "mqtt_secret"
```
Leere Strings für WiFi-Parameter bedeuten: keine Änderung. Nur MQTT wird gesetzt.

#### 7. MQTT-Passwort ohne Host ändern
```bash
./setup-tasmota-77.sh 192.168.0.100 "" "" "" "" "neues_mqtt_passwort"
```
⚠️ **Hinweis**: MQTT-Passwort wird nur gesetzt, wenn auch MQTT_HOST angegeben ist.

## Konfigurierte Einstellungen

### Basis-Konfiguration
- **DeviceName**: Tasmota-77
- **FriendlyName**: Tasmota-77
- **Topic**: tasmota_C6D100
- **MQTT Client**: DVES_C6D100
- **MQTT User**: DVES_USER

### Netzwerk-Einstellungen
- **WifiConfig**: 4 (Retry other AP without restart)
- **WifiPower**: 19.0 dBm
- **Webserver**: 2 (Admin mode)
- **WebLog**: 2 (Info level)

### Power & LED
- **PowerOnState**: 3 (Restore last state)
- **LedState**: 1 (Show power state)
- **SaveData**: 1 (Save to flash every second)
- **SaveState**: 1 (Save power state)

### Logging
- **SerialLog**: 2 (Info level)
- **TelePeriod**: 300 (5 Minuten)

### Zeit & Zeitzone
- **Timezone**: +01:00 (MEZ)
- **Sommerzeit**: Automatisch (EU-Regeln)
  - Start: Letzter Sonntag im März, 02:00 → 03:00
  - Ende: Letzter Sonntag im Oktober, 03:00 → 02:00

## Sensoren

### DS18B20 Temperatursensoren

Das Gerät unterstützt bis zu **10 DS18B20 Sensoren** gleichzeitig:

- **Anschluss**: OneWire-Bus (GPIO konfiguriert im Template)
- **Erkennnung**: Automatisch beim Start
- **Benennung**: DS18B20-1, DS18B20-2, ..., DS18B20-10
- **Auflösung**: 0.1°C
- **Einheit**: Celsius

**Referenzgerät (tasmota-77) hat aktuell:**
- DS18B20-1: ID `0000005329E2` (21.9°C)
- DS18B20-2: ID `00000051C76D` (22.1°C)
- Platz für 8 weitere Sensoren

### BME280 Sensor

- **Anschluss**: I2C-Bus
- **Messwerte**:
  - Temperatur (-40°C bis +85°C)
  - Luftfeuchtigkeit (0-100%)
  - Luftdruck (300-1100 hPa)
- **Erkennnung**: Automatisch

## Display-Konfiguration

### Dateien

Das Display-System besteht aus zwei Dateien:

#### 1. `autoexec.be` - Display-Logik

Berry-Skript, das beim Start automatisch ausgeführt wird:

- **Funktion**: Sensor-Dashboard mit Echtzeit-Updates
- **Update-Intervall**: Jede Sekunde
- **Features**:
  - Automatische Sensor-Erkennung
  - Dynamische Anzeige (1-10 DS18B20 Sensoren)
  - BME280 Daten (Temperatur, Luftfeuchtigkeit, Druck)
  - Netzwerk-Info (IP, SSID) - Update alle 60 Sekunden
  - Uhrzeit und Datum
  - Optimierte Performance (minimale Log-Ausgabe)

**Sensor-Anzeige-Logik:**
```berry
# Zeigt bis zu 10 DS18B20 Sensoren an
# Labels: p1b20 bis p1b29
# Format: "Sensor X: 21.9°C"
# Automatische Erkennung: DS18B20-1 bis DS18B20-10
```

**Wichtige Funktionen:**
- `every_second()`: Aktualisiert Sensordaten jede Sekunde
- `every_100ms()`: Aktualisiert Uhrzeit alle 100ms
- JSON-basiertes Parsing für Sensor-Daten
- Fehlerbehandlung für fehlende Sensoren

#### 2. `pages.jsonl` - Display-Layout

JSON Lines Format mit Display-Definitionen:

- **Seite 1 (p1)**: Haupt-Dashboard
  - Header: IP-Adresse, SSID, Uhrzeit
  - BME280: Temperatur, Luftfeuchtigkeit, Druck
  - DS18B20: Bis zu 10 Sensoren
  - Layout: Optimiert für Lesbarkeit

**Label-IDs:**
- `p1b12`: IP-Adresse
- `p1b13`: WiFi SSID
- `p1b14`: Uhrzeit
- `p1b15`: Datum
- `p1b16`: BME280 Temperatur
- `p1b17`: BME280 Luftfeuchtigkeit
- `p1b18`: BME280 Luftdruck
- `p1b20-p1b29`: DS18B20 Sensoren 1-10

### Upload der Display-Dateien

**Methode 1: Web-Interface**
1. Öffne `http://[DEVICE_IP]`
2. Gehe zu: **Consoles** → **Manage File System**
3. Wähle Datei aus: `autoexec.be` oder `pages.jsonl`
4. Klicke **Upload**
5. Nach Upload: **Restart** (oder `curl http://[DEVICE_IP]/cm?cmnd=Restart%201`)

**Methode 2: Python-Skript**
```bash
# autoexec.be hochladen
python3 upload_77_autoexec.py

# pages.jsonl hochladen
python3 upload_77_pages.py
```

**Methode 3: curl**
```bash
# autoexec.be
curl -F "file=@autoexec.be" http://[DEVICE_IP]/u2

# pages.jsonl
curl -F "file=@pages.jsonl" http://[DEVICE_IP]/u2
```

### Display-Anpassungen

#### Sensor-Anzahl ändern

In `autoexec.be` sind bereits 10 Sensoren vorbereitet. Wenn weniger Sensoren angeschlossen sind, werden die nicht vorhandenen einfach nicht angezeigt.

#### Layout ändern

In `pages.jsonl` können Position, Größe und Stil der Labels angepasst werden:

```json
{
  "page": 1,
  "id": 20,
  "obj": "label",
  "x": 10,
  "y": 150,
  "w": 300,
  "h": 20,
  "text": "Sensor 1: --",
  "text_font": 16
}
```

**Parameter:**
- `x`, `y`: Position (Pixel)
- `w`, `h`: Breite, Höhe (Pixel)
- `text_font`: Schriftgröße (12, 16, 20, 24, 28, 32)
- `text_color`: Farbe (z.B. "#FFFFFF")
- `bg_color`: Hintergrundfarbe

## Custom Parameter

### Erweiterte Konfiguration

Das Skript kann erweitert werden für zusätzliche Parameter:

#### Template konfigurieren

```bash
# Im Skript hinzufügen:
TEMPLATE='{"NAME":"ESP32-S3-Geek","GPIO":[...],"FLAG":0,"BASE":1}'
send_cmd "Template%20${TEMPLATE}"
send_cmd "Module%200"
```

#### GPIO-Pins setzen

```bash
# Beispiel: GPIO4 als DS18x20
send_cmd "GPIO4%204"  # 4 = DS18x20
```

#### SetOptions

```bash
# Beispiele für häufige SetOptions:
send_cmd "SetOption0%201"   # Save power state
send_cmd "SetOption1%201"   # Set button multipress mode
send_cmd "SetOption19%201"  # MQTT discovery
send_cmd "SetOption114%201" # Detach switches from relays
```

#### Regeln (Rules)

```bash
# Regel bei Sensor-Update
RULE1='ON DS18B20-1#Temperature DO Publish stat/temp1 %value% ENDON'
send_cmd "Rule1%20${RULE1}"
send_cmd "Rule1%201"  # Aktivieren
```

### Umgebungsvariablen

Alternativ können Parameter auch als Umgebungsvariablen gesetzt werden:

```bash
export TASMOTA_IP="192.168.0.100"
export TASMOTA_WIFI_SSID="MeinWLAN"
export TASMOTA_WIFI_PASS="MeinPasswort"
export TASMOTA_HOSTNAME="tasmota-sensor-01"
export TASMOTA_MQTT="192.168.0.50"
export TASMOTA_MQTT_PASS="mqtt_secret"

./setup-tasmota-77.sh "$TASMOTA_IP" "$TASMOTA_WIFI_SSID" "$TASMOTA_WIFI_PASS" "$TASMOTA_HOSTNAME" "$TASMOTA_MQTT" "$TASMOTA_MQTT_PASS"
```

### MQTT-Sicherheit

**Wichtige Hinweise zur MQTT-Konfiguration:**

1. **Passwort-Sicherheit**: Das MQTT-Passwort wird im Klartext übertragen. Verwenden Sie HTTPS oder ein sicheres Netzwerk.

2. **Passwort im Gerät**: Das Passwort wird im Tasmota-Gerät gespeichert und kann über die Web-Oberfläche eingesehen werden.

3. **Empfohlene Praxis**:
   ```bash
   # Passwort aus Datei lesen (nicht in Shell-History)
   MQTT_PASS=$(cat /secure/mqtt_password.txt)
   ./setup-tasmota-77.sh 192.168.0.100 "SSID" "Pass" "hostname" "mqtt.broker" "$MQTT_PASS"
   ```

4. **MQTT-Benutzer ändern**: Standardmäßig wird `DVES_USER` verwendet. Für mehr Sicherheit:
   ```bash
   # Im Skript oder manuell:
   curl -s "http://192.168.0.100/cm?cmnd=MqttUser%20custom_user"
   ```

## Fehlerbehebung

### Gerät nicht erreichbar

```bash
# Ping testen
ping 192.168.0.77

# Port 80 prüfen
curl -v http://192.168.0.77
```

### WiFi-Verbindung fehlgeschlagen

1. Gerät in AP-Modus versetzen (Button 6 Sekunden halten)
2. Mit AP verbinden: `tasmota-XXXXXX`
3. Browser öffnen: `http://192.168.4.1`
4. WiFi manuell konfigurieren

### Sensoren werden nicht erkannt

```bash
# Sensor-Status prüfen
curl -s "http://192.168.0.77/cm?cmnd=Status%208" | python3 -m json.tool

# GPIO-Konfiguration prüfen
curl -s "http://192.168.0.77/cm?cmnd=GPIO"

# Template prüfen
curl -s "http://192.168.0.77/cm?cmnd=Template"
```

### Display zeigt keine Daten

1. Prüfe ob `autoexec.be` hochgeladen wurde:
   ```bash
   curl -s "http://192.168.0.77/cm?cmnd=Ufs"
   ```

2. Berry-Console öffnen und Fehler prüfen:
   - Web-Interface → Consoles → Berry Scripting

3. Neustart erzwingen:
   ```bash
   curl -s "http://192.168.0.77/cm?cmnd=Restart%201"
   ```

## Backup & Restore

### Konfiguration sichern

```bash
# Vollständige Konfiguration
curl -s "http://192.168.0.77/dl" > tasmota-backup.dmp

# Nur Einstellungen
curl -s "http://192.168.0.77/cm?cmnd=Status%200" > config.json
```

### Konfiguration wiederherstellen

```bash
# Via Web-Interface: Configuration → Restore Configuration
# Datei auswählen: tasmota-backup.dmp
```

## Weitere Ressourcen

- **Tasmota Dokumentation**: https://tasmota.github.io/docs/
- **Berry Scripting**: https://tasmota.github.io/docs/Berry/
- **HASPmota Display**: https://tasmota.github.io/docs/HASPmota/
- **Sensor-Konfiguration**: https://tasmota.github.io/docs/Supported-Peripherals/
- **MQTT Integration**: https://tasmota.github.io/docs/MQTT/

## Lizenz

Dieses Skript basiert auf der Konfiguration des Tasmota-Projekts und steht unter der gleichen Lizenz.
