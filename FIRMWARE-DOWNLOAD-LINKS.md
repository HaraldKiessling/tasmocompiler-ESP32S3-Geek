# Tasmota ESP32-S3-Geek Firmware - Download & OTA Links

## Firmware-Informationen

### Build-Details
- **Version**: Tasmota 15.0.1
- **Build-Datum**: 2026-01-10 13:52 UTC
- **Hardware**: Waveshare ESP32-S3-Geek
- **Dateiname**: `tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin`
- **Größe**: 2.7 MB (2,790,256 Bytes)
- **MD5**: `0ecc46e94126d688305535f095582ef6`
- **ESP-IDF**: 5.3.3.250501

### Aktivierte Features
- ✅ 10x DS18x20 Temperatursensoren (1-Wire)
- ✅ BME280 Sensor (I2C) - Temperatur, Luftfeuchtigkeit, Luftdruck
- ✅ ST7789V Display (240x135, SPI)
- ✅ CST816S Touch Controller
- ✅ LittleFS Filesystem (320 KB)
- ✅ LVGL Display-Framework (v9.3.0)
- ✅ Berry Scripting Engine
- ✅ Matter/Thread Support
- ✅ MQTT Client
- ✅ OTA Updates

---

## Download-Links

### 1. Direkter Download (Gitpod OTA-Server)

**Web-Interface:**
```
https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev
```

**Direkter Firmware-Download:**
```
https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

### 2. Lokaler Download

Firmware-Datei befindet sich im Repository:
```
/workspaces/tasmocompiler/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

Oder im OTA-Server-Verzeichnis:
```
/workspaces/tasmocompiler/ota-server/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

---

## OTA-Update Methoden

### Methode 1: OTA-URL in Tasmota setzen (Empfohlen)

**Schritt 1: OTA-URL setzen**
```
OtaUrl https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Schritt 2: Update starten**
```
Upgrade 1
```

**Oder als Backlog-Befehl:**
```
Backlog OtaUrl https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin; Upgrade 1
```

**Via curl:**
```bash
TASMOTA_IP="tasmota-XX.samharald.eu"
OTA_URL="https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"

# OTA-URL setzen und Update starten
curl -k -s "https://${TASMOTA_IP}/cm?cmnd=Backlog%20OtaUrl%20${OTA_URL};Upgrade%201"
```

### Methode 2: Datei-Upload via Web-Interface

1. Firmware-Datei herunterladen
2. Tasmota Web-Interface öffnen: `https://tasmota-XX.samharald.eu`
3. Menü: `Firmware Upgrade`
4. `Choose File` → Firmware-Datei auswählen
5. `Start Upgrade` klicken
6. Warten auf Upload (ca. 8-10 Sekunden)
7. Automatischer Neustart (ca. 60-90 Sekunden)

### Methode 3: curl-Upload

```bash
TASMOTA_IP="tasmota-XX.samharald.eu"
FIRMWARE="tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"

curl -k -v \
    --connect-timeout 30 \
    --max-time 300 \
    -F "file=@${FIRMWARE}" \
    "https://${TASMOTA_IP}/u3"
```

### Methode 4: Automatisches Skript

```bash
./test-ota-from-server.sh
```

Das Skript führt automatisch aus:
- Erreichbarkeitsprüfung des OTA-Servers
- OTA-URL setzen in Tasmota
- Update starten
- Neustart überwachen
- Versions-Verifikation
- BME280-Sensor-Test

---

## Verifikation nach Update

### 1. Firmware-Version prüfen

```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%202" | jq '.StatusFWR'
```

**Erwartete Ausgabe:**
```json
{
  "Version": "15.0.1(tasmota32)",
  "BuildDateTime": "2026-01-10T13:50:12",
  "Core": "3_1_3",
  "SDK": "5.3.3.250501",
  "CpuFrequency": 240,
  "Hardware": "ESP32-S3 v0.2"
}
```

### 2. BME280 Sensoren prüfen

**I2C-Scan:**
```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=I2CScan"
```

**Erwartete Ausgabe:**
```json
{"I2CScan":"Device(s) found on bus1 at 0x76 0x77"}
```

**Sensor-Werte:**
```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%208" | jq '.StatusSNS'
```

**Erwartete Ausgabe:**
```json
{
  "Time": "2026-01-10T15:05:27",
  "BME280-76": {
    "Temperature": 3.4,
    "Humidity": 76.5,
    "DewPoint": -0.4,
    "Pressure": 971.8
  },
  "BME280-77": {
    "Temperature": 9.9,
    "Humidity": 73.7,
    "DewPoint": 5.4,
    "Pressure": 972.6
  },
  "PressureUnit": "hPa",
  "TempUnit": "C"
}
```

### 3. Netzwerk-Informationen prüfen

```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%205" | jq '.StatusNET'
```

**Erwartete Ausgabe:**
```json
{
  "Hostname": "tasmota-F82084-0132",
  "IPAddress": "192.168.0.75",
  "Gateway": "192.168.0.1",
  "Subnetmask": "255.255.255.0",
  "DNSServer1": "192.168.0.1",
  "Mac": "28:37:2F:F8:20:84",
  "Webserver": 2,
  "HTTP_API": 1,
  "WifiConfig": 4,
  "WifiPower": 19.0
}
```

### 4. WiFi & Zeit prüfen

```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%2011" | jq '.StatusSTS | {Time, Wifi}'
```

**Erwartete Ausgabe:**
```json
{
  "Time": "2026-01-10T15:05:36",
  "Wifi": {
    "AP": 1,
    "SSId": "miVida2",
    "BSSId": "BA:AF:CA:85:DF:75",
    "Channel": 7,
    "Mode": "HT40",
    "RSSI": 98,
    "Signal": -51,
    "LinkCount": 1,
    "Downtime": "0T00:00:03"
  }
}
```

### 5. MQTT-Konfiguration prüfen

```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Status%206" | jq '.StatusMQT'
```

**Erwartete Ausgabe:**
```json
{
  "MqttHost": "192.168.0.12",
  "MqttPort": 1883,
  "MqttClientMask": "DVES_%06X",
  "MqttClient": "DVES_F82084",
  "MqttUser": "mqtthome",
  "MqttCount": 1,
  "MqttTLS": 0,
  "MAX_PACKET_SIZE": 1200,
  "KEEPALIVE": 30,
  "SOCKET_TIMEOUT": 4
}
```

---

## Test-Ergebnisse (Tasmota-75)

### ✅ Erfolgreiche Tests

| Test | Status | Ergebnis |
|------|--------|----------|
| OTA-Update von Server | ✅ | Erfolgreich |
| Firmware-Version | ✅ | 15.0.1 (2026-01-10) |
| BME280 Sensor 0x76 | ✅ | Temp: 3.4°C, Hum: 76.5%, Press: 971.8 hPa |
| BME280 Sensor 0x77 | ✅ | Temp: 9.9°C, Hum: 73.7%, Press: 972.6 hPa |
| IP-Adresse | ✅ | 192.168.0.75 |
| WiFi SSID | ✅ | miVida2 |
| WiFi Signal | ✅ | RSSI: 98, Signal: -51 dBm |
| Uhrzeit | ✅ | 2026-01-10T15:05:36 (NTP sync) |
| MQTT-Verbindung | ✅ | Host: 192.168.0.12, User: mqtthome |
| LittleFS | ✅ | Filesystem aktiv |
| Berry | ✅ | Scripting Engine aktiv |

---

## OTA-Server Setup

### Lokaler OTA-Server starten

```bash
cd ota-server
python3 -m http.server 8000
```

**Server-URL:**
```
http://localhost:8000
```

**Firmware-URL:**
```
http://localhost:8000/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

### Gitpod OTA-Server (bereits aktiv)

**Web-Interface:**
```
https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev
```

**Features:**
- ✅ Firmware-Download
- ✅ OTA-Anleitung
- ✅ Verifikations-Befehle
- ✅ Feature-Übersicht
- ✅ MD5-Prüfsumme

---

## MD5-Prüfsumme verifizieren

```bash
md5sum tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Erwartete Ausgabe:**
```
0ecc46e94126d688305535f095582ef6  tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

---

## Troubleshooting

### OTA-Update schlägt fehl

**Problem**: Update wird nicht durchgeführt

**Lösung 1**: Prüfe OTA-Server Erreichbarkeit
```bash
curl -I https://8000--019b9edf-ce0e-7895-a426-a85956ad52b2.eu-central-1-01.gitpod.dev/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Lösung 2**: Verwende Datei-Upload statt OTA-URL
```bash
curl -k -F "file=@tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin" \
    "https://tasmota-XX.samharald.eu/u3"
```

### BME280 nicht erkannt

**Problem**: Sensoren werden nicht angezeigt

**Lösung**: Prüfe I2C-Konfiguration
```bash
# I2C-Scan
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=I2CScan"

# GPIO prüfen (SDA=GPIO8, SCL=GPIO9)
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=GPIO"

# I2C-Treiber prüfen
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=I2CDriver"
```

### Alte Firmware läuft nach Update

**Problem**: Build-Datum ist nicht 2026-01-10

**Lösung**: Erzwinge Neustart
```bash
curl -k -s "https://tasmota-XX.samharald.eu/cm?cmnd=Restart%201"
```

---

## Support & Ressourcen

- **Tasmota Dokumentation**: [https://tasmota.github.io/docs/](https://tasmota.github.io/docs/)
- **OTA-Update Guide**: [https://tasmota.github.io/docs/Upgrading/](https://tasmota.github.io/docs/Upgrading/)
- **BME280 Sensor**: [https://tasmota.github.io/docs/BME280/](https://tasmota.github.io/docs/BME280/)
- **Berry Scripting**: [https://tasmota.github.io/docs/Berry/](https://tasmota.github.io/docs/Berry/)
- **GitHub**: [https://github.com/arendst/Tasmota](https://github.com/arendst/Tasmota)

---

**Letzte Aktualisierung**: 2026-01-10 15:05 UTC  
**Firmware-Version**: 15.0.1  
**Hardware**: Waveshare ESP32-S3-Geek  
**Status**: ✅ Getestet und funktionsfähig
