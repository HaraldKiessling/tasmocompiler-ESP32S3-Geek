#!/bin/bash

# OTA-Upload für Tasmota-77 mit optimierter Firmware

TASMOTA_IP="tasmota-77.samharald.eu"
BASE_URL="https://${TASMOTA_IP}"
FIRMWARE="/tmp/firmware-for-tasmota77.bin"

echo "=== OTA-Upload für Tasmota-77 ==="
echo "Firmware: $FIRMWARE"
echo "Ziel: $TASMOTA_IP"
echo ""

# Prüfe Firmware-Datei
if [ ! -f "$FIRMWARE" ]; then
    echo "❌ Firmware-Datei nicht gefunden: $FIRMWARE"
    exit 1
fi

FILESIZE=$(stat -c%s "$FIRMWARE" 2>/dev/null || stat -f%z "$FIRMWARE" 2>/dev/null)
echo "Firmware-Größe: $FILESIZE Bytes ($(echo "scale=2; $FILESIZE/1024/1024" | bc) MB)"
echo ""

# Prüfe Tasmota-Erreichbarkeit
echo "1. Prüfe Tasmota-Erreichbarkeit..."
if ! curl -k -s --connect-timeout 5 "${BASE_URL}/cm?cmnd=Status" > /dev/null; then
    echo "❌ Tasmota nicht erreichbar!"
    exit 1
fi
echo "✅ Tasmota erreichbar"
echo ""

# Zeige aktuelle Version
echo "2. Aktuelle Firmware-Version:"
curl -k -s "${BASE_URL}/cm?cmnd=Status 2" | jq -r '.StatusFWR.Version'
echo ""

# Starte OTA-Upload
echo "3. Starte OTA-Upload..."
echo "Dies kann 2-3 Minuten dauern..."
echo ""

curl -k -v \
    --connect-timeout 30 \
    --max-time 300 \
    -F "file=@${FIRMWARE}" \
    "${BASE_URL}/u3" 2>&1 | tee /tmp/ota_upload.log

echo ""
echo "4. Warte auf Neustart (60 Sekunden)..."
sleep 60

# Prüfe neue Version
echo ""
echo "5. Prüfe neue Firmware-Version:"
for i in {1..5}; do
    if curl -k -s --connect-timeout 5 "${BASE_URL}/cm?cmnd=Status 2" > /tmp/status.json 2>/dev/null; then
        cat /tmp/status.json | jq -r '.StatusFWR'
        break
    fi
    echo "Versuch $i/5 - warte..."
    sleep 10
done

echo ""
echo "=== OTA-Upload abgeschlossen ==="
echo "Prüfe Web-Interface: ${BASE_URL}"
