# 📥 Tasmota ESP32 S3 LVGL Firmware - Download Anleitung

## ✅ Firmware erfolgreich kompiliert!

Die Firmware wurde mit Ihren WiFi-Zugangsdaten erstellt:
- **SSID**: miVida2
- **Passwort**: m1Curaz#n

---

## 📦 Download-Optionen

### Option 1: Einzelne Dateien herunterladen (EMPFOHLEN)

Öffnen Sie im VSCode File Explorer (links) den Ordner:
```
/workspaces/tasmocompiler/firmware_output/
```

**Rechtsklick auf die Datei → "Download"**

**Benötigte Dateien:**
- `tasmota32s3.factory.bin` (3.0 MB) - Für Initial-Flash
- `tasmota32s3.bin` (2.1 MB) - Für OTA-Updates
- `WIFI_INFO.txt` - WiFi-Informationen
- `user_config_override.h` - Konfiguration (optional)

### Option 2: Komplettes Archiv herunterladen

Datei: `/workspaces/tasmocompiler/tasmota32s3-lvgl-v15.0.1-wifi.tar.gz` (3.3 MB)

**Rechtsklick → "Download"**

Entpacken mit:
```bash
tar -xzf tasmota32s3-lvgl-v15.0.1-wifi.tar.gz
```

### Option 3: Via Terminal herunterladen

```bash
# In Ihr lokales Verzeichnis wechseln
cd ~/Downloads

# Dateien mit scp kopieren (wenn SSH aktiviert)
# Oder einfach im VSCode File Explorer rechtsklick → Download
```

---

## 🔧 Flash-Anleitung

### Methode 1: ESPHome Web Flasher (EINFACHSTE METHODE)

1. Öffnen Sie: https://web.esphome.io/
2. Klicken Sie auf "Connect"
3. Wählen Sie Ihren ESP32 S3 USB-Port
4. Klicken Sie auf "Install"
5. Wählen Sie `tasmota32s3.factory.bin`
6. Warten Sie bis der Flash-Vorgang abgeschlossen ist

### Methode 2: Tasmota Web Installer

1. Öffnen Sie: https://tasmota.github.io/install/
2. Verbinden Sie ESP32 S3 via USB
3. Klicken Sie auf "Connect"
4. Wählen Sie "Install" → "Choose File"
5. Wählen Sie `tasmota32s3.factory.bin`
6. Flash starten

### Methode 3: esptool.py (Kommandozeile)

**Installation:**
```bash
pip install esptool
```

**Flash-Befehl:**
```bash
esptool.py --chip esp32s3 --port /dev/ttyUSB0 --baud 460800 \
  write_flash -z 0x0 tasmota32s3.factory.bin
```

**Port anpassen:**
- Linux: `/dev/ttyUSB0` oder `/dev/ttyACM0`
- macOS: `/dev/cu.usbserial-*` oder `/dev/cu.wchusbserial*`
- Windows: `COM3`, `COM4`, etc.

**Port finden:**
```bash
# Linux/macOS
ls /dev/tty* | grep -i usb

# Windows (PowerShell)
Get-WmiObject Win32_SerialPort | Select-Object Name,DeviceID
```

---

## 🌐 Nach dem Flashen

### Automatische WiFi-Verbindung

Das Gerät verbindet sich automatisch mit:
- **SSID**: miVida2
- **Passwort**: m1Curaz#n

### IP-Adresse finden

**Option 1: Router-Interface**
- Melden Sie sich in Ihrem Router an
- Suchen Sie nach "tasmota-" oder der MAC-Adresse
- Notieren Sie die zugewiesene IP

**Option 2: Netzwerk-Scan**
```bash
# Linux/macOS
sudo nmap -sn 192.168.1.0/24 | grep -i tasmota

# Oder mit arp
arp -a | grep -i espressif
```

**Option 3: Tasmota Discovery**
- Öffnen Sie: http://tasmota.local (funktioniert nicht immer)

### Tasmota Web-Interface öffnen

```
http://[IP-ADRESSE]
```

Beispiel: `http://192.168.1.100`

---

## 🔄 OTA-Update (für spätere Updates)

Wenn Sie die Firmware später aktualisieren möchten:

1. Tasmota Web-Interface öffnen
2. **Firmware Upgrade** anklicken
3. `tasmota32s3.bin` auswählen (NICHT .factory.bin!)
4. **Start Upgrade** klicken
5. Warten bis Neustart abgeschlossen ist

---

## ⚠️ Troubleshooting

### Gerät verbindet sich nicht mit WiFi

**Fallback Access Point:**
Nach mehreren fehlgeschlagenen Verbindungsversuchen öffnet Tasmota einen eigenen AP:
- **SSID**: `tasmota-XXXXXX` (XXXXXX = Teil der MAC-Adresse)
- **Passwort**: Keins (offenes Netzwerk)

**Verbinden und konfigurieren:**
1. Mit dem Tasmota-AP verbinden
2. Browser öffnet automatisch Konfigurationsseite
3. WiFi-Zugangsdaten eingeben

### Flash-Fehler

**"Failed to connect":**
- ESP32 S3 in Boot-Modus versetzen:
  - BOOT-Taste gedrückt halten
  - RESET-Taste kurz drücken
  - BOOT-Taste loslassen
  - Erneut flashen

**"Port not found":**
- USB-Kabel überprüfen (Datenkabel, nicht nur Ladekabel)
- Treiber installieren (CP210x oder CH340)
- Anderen USB-Port versuchen

### Serielle Konsole öffnen

```bash
# Mit screen (Linux/macOS)
screen /dev/ttyUSB0 115200

# Mit PuTTY (Windows)
# Serial, COM3, 115200 Baud

# Mit Arduino Serial Monitor
# Tools → Serial Monitor → 115200 Baud
```

---

## 📋 Checksummen (MD5)

Zur Überprüfung der Datei-Integrität:

```
67a9df7be61fbf08b591770fea0608e2  tasmota32s3.bin
f2047098a1b9d4e21b6c6b0845122be0  tasmota32s3.factory.bin
```

**Überprüfen:**
```bash
md5sum tasmota32s3.factory.bin
```

---

## 📚 Weitere Ressourcen

- **Tasmota Dokumentation**: https://tasmota.github.io/docs/
- **LVGL Display Setup**: https://tasmota.github.io/docs/LVGL/
- **Berry Scripting**: https://tasmota.github.io/docs/Berry/
- **Tasmota Commands**: https://tasmota.github.io/docs/Commands/

---

## 🎯 Nächste Schritte nach dem Flash

1. ✅ Gerät flashen
2. ✅ Mit WiFi "miVida2" verbinden (automatisch)
3. ✅ IP-Adresse im Router finden
4. ✅ Tasmota Web-Interface öffnen
5. 🎨 Display konfigurieren (siehe LVGL Dokumentation)
6. 🔧 Gerät nach Ihren Wünschen anpassen

---

**Build-Informationen:**
- Version: Tasmota v15.0.1
- Board: ESP32 S3
- Features: LVGL, Berry, File System, Rules
- Build-Datum: 2026-01-08
- Compiler: TasmoCompiler (Gitpod)

Viel Erfolg! 🚀
