# 🌿 Branch Information - Tasmota ESP32 S3 LVGL v15.0.1

**Branch Name**: `tasmota-esp32s3-lvgl-v15.0.1`  
**Created**: 2026-01-09 13:22 UTC  
**Commit**: 306f189  
**Status**: ✅ Lokal gesichert  

---

## 📋 BRANCH-ÜBERSICHT

Dieser Branch enthält alle Ergebnisse der Tasmota ESP32 S3 LVGL Firmware-Entwicklung:

- ✅ Custom Firmware Build (v15.0.1)
- ✅ Erweiterte Features (DS18X20: 10 Sensoren, Roboto Fonts)
- ✅ Korrigierte Berry Scripts
- ✅ Umfassende Dokumentation
- ✅ Test-Reports
- ✅ Firmware-Binaries

---

## 📁 BRANCH-INHALT

### Firmware-Dateien (firmware_output/)
```
firmware_output/
├── tasmota32s3.bin              (2.1 MB) - OTA Update
├── tasmota32s3.factory.bin      (3.0 MB) - Initial Flash
├── user_config_override.h       (2.7 KB) - Build-Konfiguration
├── platformio_override.ini      (280 B)  - PlatformIO-Config
├── autoexec.be                  (3.6 KB) - Berry Script (korrigiert)
├── pages.jsonl                  (1.0 KB) - LVGL Pages (korrigiert)
├── Roboto-Regular.ttf           (342 KB) - Font
├── Roboto-Bold.ttf              (343 KB) - Font
└── Roboto-Light.ttf             (342 KB) - Font
```

### Dokumentation (firmware_output/)
```
├── CHANGELOG.txt                - Änderungsprotokoll
├── DS18X20_ANLEITUNG.md         - Sensor-Anleitung
├── README_FONTS.md              - Font-Verwendung
├── FIRMWARE_TEST_REPORT.md      - Test-Ergebnisse
├── SCRIPT_CORRECTION_REPORT.md  - Script-Korrekturen
└── BUTTON_FIX_REPORT.md         - Button-Fix Details
```

### Root-Verzeichnis
```
├── DOWNLOAD_ANLEITUNG_V2.md     - Download & Installation
├── tasmota32s3-lvgl-v15.0.1-extended.tar.gz (3.9 MB)
├── compile_esp32_lvgl.js        - Compile-Script
├── test_firmware.sh             - Test-Script
├── upload_firmware.sh           - Upload-Script
└── .devcontainer/               - Gitpod-Konfiguration
```

---

## 🎯 NEUE FEATURES

### 1. DS18X20 Sensor-Limit erhöht
- **Vorher**: 8 Sensoren
- **Nachher**: 10 Sensoren
- **Konfiguration**: `DS18X20_MAX_SENSORS 10`

### 2. Roboto Font-Familie
- Roboto-Regular.ttf (342 KB)
- Roboto-Bold.ttf (343 KB)
- Roboto-Light.ttf (342 KB)
- Verwendung in LVGL via Berry

### 3. WiFi voreingestellt
- **SSID**: miVida2
- **Passwort**: m1Curaz#n
- Automatische Verbindung nach Flash

### 4. Korrigierte Berry Scripts
- **autoexec.be**: WiFi/IP-Anzeige korrigiert, toggle_page() Funktion
- **pages.jsonl**: Button-Actions korrigiert (p1, p2)
- Keine Exceptions mehr

---

## 📊 COMMIT-DETAILS

**Commit Hash**: 306f189

**Commit Message**:
```
Add Tasmota ESP32 S3 LVGL v15.0.1 firmware with extended features

- Custom firmware build for ESP32 S3 with LVGL support
- DS18X20 sensor limit increased from 8 to 10 sensors
- Roboto fonts included (Regular, Bold, Light)
- WiFi pre-configured: miVida2
- Fixed Berry scripts (autoexec.be, pages.jsonl)
- Corrected page switching functionality
- Added comprehensive documentation and test reports
- Includes firmware binaries and configuration files
```

**Geänderte Dateien**: 32 Dateien
- **Hinzugefügt**: 31 neue Dateien
- **Geändert**: 1 Datei (package-lock.json)
- **Zeilen**: +4563 / -31

---

## 🔧 BRANCH VERWENDEN

### Lokaler Zugriff

**Branch wechseln:**
```bash
cd /workspaces/tasmocompiler
git checkout tasmota-esp32s3-lvgl-v15.0.1
```

**Branch-Status prüfen:**
```bash
git status
git log --oneline -5
```

**Dateien anzeigen:**
```bash
ls -la firmware_output/
```

---

## 📤 BRANCH EXPORTIEREN

### Option 1: Als Patch exportieren

```bash
cd /workspaces/tasmocompiler
git format-patch master..tasmota-esp32s3-lvgl-v15.0.1 -o patches/
```

### Option 2: Als Bundle exportieren

```bash
cd /workspaces/tasmocompiler
git bundle create tasmota-esp32s3-lvgl.bundle tasmota-esp32s3-lvgl-v15.0.1
```

### Option 3: Als Archiv exportieren

```bash
cd /workspaces/tasmocompiler
git archive --format=tar.gz --output=tasmota-esp32s3-lvgl-branch.tar.gz tasmota-esp32s3-lvgl-v15.0.1
```

### Option 4: Zu eigenem Repository pushen

Wenn Sie ein eigenes GitHub-Repository haben:

```bash
# Remote hinzufügen
git remote add myfork https://github.com/IHR_USERNAME/tasmocompiler.git

# Branch pushen
git push myfork tasmota-esp32s3-lvgl-v15.0.1
```

---

## 🔀 FORK ERSTELLEN (Optional)

Falls Sie das Repository forken möchten:

1. **Auf GitHub**: Gehen Sie zu https://github.com/benzino77/tasmocompiler
2. Klicken Sie auf **"Fork"** (oben rechts)
3. Warten Sie bis Fork erstellt ist
4. **In Gitpod**:
   ```bash
   cd /workspaces/tasmocompiler
   git remote add myfork https://github.com/IHR_USERNAME/tasmocompiler.git
   git push myfork tasmota-esp32s3-lvgl-v15.0.1
   ```

---

## 📋 BRANCH-VERGLEICH

**Unterschiede zu master:**

```bash
# Dateien vergleichen
git diff master..tasmota-esp32s3-lvgl-v15.0.1 --stat

# Commits anzeigen
git log master..tasmota-esp32s3-lvgl-v15.0.1 --oneline
```

**Ergebnis:**
- 31 neue Dateien
- 1 geänderte Datei
- 4563 neue Zeilen
- 31 gelöschte Zeilen

---

## 🎯 VERWENDUNGSZWECK

Dieser Branch dient als:

1. **Backup**: Alle Arbeitsergebnisse gesichert
2. **Dokumentation**: Vollständige Entwicklungshistorie
3. **Wiederverwendung**: Einfacher Zugriff auf alle Dateien
4. **Sharing**: Kann exportiert und geteilt werden
5. **Referenz**: Für zukünftige Builds

---

## 📦 FIRMWARE-DETAILS

**Build-Informationen:**
- **Version**: Tasmota 15.0.1
- **Board**: ESP32 S3
- **Build-Datum**: 2026-01-09 10:53:29 UTC
- **Core**: 3_1_3
- **SDK**: 5.3.3.250501
- **CPU**: 240 MHz

**Firmware-Größen:**
- **tasmota32s3.bin**: 2.1 MB (OTA)
- **tasmota32s3.factory.bin**: 3.0 MB (Initial)
- **Flash**: 2200 KB verwendet (74.6%)
- **RAM**: 59 KB verwendet (18.1%)

**Checksummen (MD5):**
```
1be15f06f2554f7fd1e9c4476e021fe6  tasmota32s3.bin
e49233e14030efa7df41857a3357cc6b  tasmota32s3.factory.bin
```

---

## ✅ GETESTETE FUNKTIONEN

| Feature | Status | Details |
|---------|--------|---------|
| **Firmware-Build** | ✅ | Erfolgreich kompiliert |
| **OTA-Upload** | ✅ | Auf Gerät getestet |
| **WiFi miVida2** | ✅ | Automatische Verbindung |
| **DS18B20 Sensoren** | ✅ | 2 von 10 getestet |
| **LVGL Display** | ✅ | 240x135 aktiv |
| **Berry Scripts** | ✅ | Keine Exceptions |
| **Page Switching** | ✅ | Funktioniert |
| **WiFi/IP Display** | ✅ | Korrekte Anzeige |

---

## 📚 DOKUMENTATION

**Vollständige Dokumentation im Branch:**

1. **DOWNLOAD_ANLEITUNG_V2.md** - Installation & Setup
2. **FIRMWARE_TEST_REPORT.md** - Test-Ergebnisse
3. **SCRIPT_CORRECTION_REPORT.md** - Script-Korrekturen
4. **BUTTON_FIX_REPORT.md** - Button-Fix Details
5. **DS18X20_ANLEITUNG.md** - Sensor-Konfiguration
6. **README_FONTS.md** - Font-Verwendung
7. **CHANGELOG.txt** - Änderungsprotokoll

---

## 🔐 BRANCH-SICHERHEIT

**Lokale Sicherung:**
- ✅ Branch lokal erstellt
- ✅ Commit durchgeführt
- ✅ Alle Dateien gesichert

**Hinweis**: Der Branch ist nur lokal gespeichert, da keine Push-Rechte für das Original-Repository vorhanden sind. Um den Branch dauerhaft zu sichern:

1. Erstellen Sie einen Fork des Repositories
2. Pushen Sie den Branch zu Ihrem Fork
3. Oder exportieren Sie den Branch als Bundle/Archiv

---

## 🚀 NÄCHSTE SCHRITTE

### Empfohlene Aktionen:

1. **Branch exportieren** (siehe "BRANCH EXPORTIEREN")
2. **Fork erstellen** (optional, für dauerhaften Remote-Zugriff)
3. **Firmware testen** (auf weiteren Geräten)
4. **Dokumentation teilen** (mit anderen Nutzern)

### Branch-Befehle:

```bash
# Branch anzeigen
git branch -v

# Zu Branch wechseln
git checkout tasmota-esp32s3-lvgl-v15.0.1

# Branch-Inhalt anzeigen
git ls-tree -r --name-only tasmota-esp32s3-lvgl-v15.0.1

# Branch als Archiv exportieren
git archive --format=tar.gz --output=branch-backup.tar.gz tasmota-esp32s3-lvgl-v15.0.1
```

---

**Branch erstellt von**: Ona (TasmoCompiler)  
**Erstellungsdatum**: 2026-01-09 13:22 UTC  
**Commit**: 306f189  
**Status**: ✅ **LOKAL GESICHERT**

---

## 📞 SUPPORT

Bei Fragen zum Branch oder zur Firmware:
- Dokumentation im Branch lesen
- Test-Reports prüfen
- Firmware auf Gerät testen

**Alle Ergebnisse sind im Branch gesichert und können jederzeit abgerufen werden!**
