# Upload-Anleitung: Firmware auf tasmota-75

## Firmware-Datei

**Datei:** `tasmota32s3-v15.0.1-Matter-HA-BME280.bin`  
**Größe:** 2.5 MB  
**Version:** ESP32S3-Geek-Matter-HA-BME280  

## Upload-Methoden

### Methode 1: Web-Interface (Empfohlen)

1. **Firmware herunterladen:**
   - Gehen Sie zu: [GitHub Repository](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek)
   - Branch: `tasmota-esp32s3-lvgl-v15.0.1`
   - Datei: `tasmota32s3-v15.0.1-Matter-HA-BME280.bin`
   - Klicken Sie auf "Download"

2. **Tasmota Web-Interface öffnen:**
   - URL: [https://tasmota-75.samharald.eu](https://tasmota-75.samharald.eu)

3. **Firmware Upgrade:**
   - Klicken Sie auf "Firmware Upgrade"
   - Klicken Sie auf "Choose File"
   - Wählen Sie `tasmota32s3-v15.0.1-Matter-HA-BME280.bin`
   - Klicken Sie auf "Start Upgrade"

4. **Warten:**
   - Upload dauert ca. 30-60 Sekunden
   - Installation dauert ca. 1-2 Minuten
   - Gerät startet automatisch neu
   - **NICHT** die Stromversorgung unterbrechen!

5. **Verifizierung:**
   - Nach Neustart: Web-Interface öffnen
   - Gehen Sie zu "Information"
   - Prüfen Sie Version: sollte "ESP32S3-Geek-Matter-HA-BME280" enthalten

### Methode 2: OTA via URL (Alternativ)

Falls Sie die Firmware auf einem Webserver hosten:

1. **Firmware auf Webserver hochladen**
2. **Tasmota Konsole öffnen**
3. **Befehl eingeben:**
   ```
   OtaUrl http://your-server.com/tasmota32s3-v15.0.1-Matter-HA-BME280.bin
   Upgrade 1
   ```

### Methode 3: esptool.py (Bei Problemen)

Falls OTA nicht funktioniert:

1. **ESP32 mit USB verbinden**
2. **Boot-Modus aktivieren** (Boot-Button beim Einschalten gedrückt halten)
3. **Flash-Befehl:**
   ```bash
   esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 921600 \
     write_flash -z 0x0 tasmota32s3-v15.0.1-Matter-HA-BME280.bin
   ```

## Nach dem Upload

### 1. Erste Schritte

Nach dem Neustart:

1. **Web-Interface öffnen:** [https://tasmota-75.samharald.eu](https://tasmota-75.samharald.eu)
2. **Version prüfen:** Information → Version sollte "ESP32S3-Geek-Matter-HA-BME280" zeigen
3. **Konsole öffnen:** Consoles → Console

### 2. Matter aktivieren

```
Matter 1
```

Ein QR-Code wird generiert. Scannen Sie diesen mit Ihrer Matter-App (Apple Home, Google Home, etc.)

### 3. Home Assistant konfigurieren

#### MQTT Setup:
```
Backlog MqttHost <broker-ip>; MqttUser <user>; MqttPassword <password>
SetOption19 1
```

#### Discovery triggern:
```
HAssDiscovery
```

### 4. BME280 prüfen

```
I2CScan
```

Sollte BME280 an Adresse 0x76 oder 0x77 zeigen.

```
Status 8
```

Zeigt Sensor-Werte an.

### 5. Display-Dateien hochladen

Falls noch nicht vorhanden:

1. **pages.jsonl** hochladen (Manage File system)
2. **autoexec_optimized.be** als **autoexec.be** hochladen
3. **Restart 1**

## Troubleshooting

### Upload schlägt fehl

**Problem:** "Upload Failed" oder "Not enough space"

**Lösung:**
1. Prüfen Sie freien Flash-Speicher: `Status 2`
2. Löschen Sie alte Firmware-Backups
3. Versuchen Sie Methode 3 (esptool.py)

### Gerät startet nicht

**Problem:** Nach Upload startet Gerät nicht mehr

**Lösung:**
1. Stromversorgung trennen und wieder verbinden
2. Falls immer noch nicht: esptool.py verwenden (Methode 3)
3. Notfalls: Alte Firmware flashen

### Matter funktioniert nicht

**Problem:** Matter lässt sich nicht aktivieren

**Lösung:**
1. Prüfen: `Matter` zeigt Status
2. Neustart: `Restart 1`
3. Erneut aktivieren: `Matter 1`

### BME280 nicht erkannt

**Problem:** I2CScan zeigt keinen BME280

**Lösung:**
1. Verkabelung prüfen (SDA, SCL, VCC, GND)
2. I2C Adresse prüfen (0x76 oder 0x77)
3. Anderen I2C Port versuchen (falls vorhanden)

## Backup vor Upload (Empfohlen)

### Konfiguration sichern:

1. **Web-Interface:** Configuration → Backup Configuration
2. **Datei speichern:** `tasmota-75-config.dmp`

### Dateien sichern:

1. **Manage File system** öffnen
2. **pages.jsonl** herunterladen
3. **autoexec.be** herunterladen

## Rollback

Falls Sie zur alten Firmware zurück möchten:

1. **Alte Firmware flashen** (via Web-Interface oder esptool.py)
2. **Konfiguration wiederherstellen:** Configuration → Restore Configuration
3. **Dateien hochladen:** pages.jsonl und autoexec.be

## Support

Bei Problemen:
- GitHub Issues: [HaraldKiessling/tasmocompiler-ESP32S3-Geek](https://github.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/issues)
- Tasmota Support: [https://github.com/arendst/Tasmota/discussions](https://github.com/arendst/Tasmota/discussions)

## Checksumme

Vor dem Upload prüfen:

```bash
md5sum tasmota32s3-v15.0.1-Matter-HA-BME280.bin
```

Vergleichen Sie mit der Checksumme im Repository.
