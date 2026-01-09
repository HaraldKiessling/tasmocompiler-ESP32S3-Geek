#!/bin/bash

DEVICE_URL="https://tasmota-77.samharald.eu"
FIRMWARE_FILE="/workspaces/tasmocompiler/firmware_output/tasmota32s3.bin"

echo "═══════════════════════════════════════════════════════════"
echo "  Tasmota Firmware OTA Upload"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "Device: $DEVICE_URL"
echo "Firmware: $FIRMWARE_FILE"
echo ""

# Check if firmware file exists
if [ ! -f "$FIRMWARE_FILE" ]; then
    echo "❌ Error: Firmware file not found!"
    exit 1
fi

# Get firmware size
FIRMWARE_SIZE=$(stat -f%z "$FIRMWARE_FILE" 2>/dev/null || stat -c%s "$FIRMWARE_FILE" 2>/dev/null)
echo "Firmware size: $(echo "scale=2; $FIRMWARE_SIZE / 1024 / 1024" | bc) MB"
echo ""

# Get current device info
echo "Getting device information..."
DEVICE_INFO=$(curl -s -k "$DEVICE_URL/in" 2>/dev/null)
if [ $? -eq 0 ]; then
    echo "✅ Device is reachable"
else
    echo "❌ Device is not reachable"
    exit 1
fi

echo ""
echo "Starting OTA upload..."
echo "This will take several minutes. Please wait..."
echo ""

# Upload firmware via OTA
RESPONSE=$(curl -k -X POST "$DEVICE_URL/u2" \
    -F "file=@$FIRMWARE_FILE" \
    --max-time 300 \
    -w "\n%{http_code}" \
    2>&1)

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
RESPONSE_BODY=$(echo "$RESPONSE" | head -n-1)

echo ""
if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "✅ Firmware upload successful!"
    echo ""
    echo "The device will now restart and apply the new firmware."
    echo "This may take 1-2 minutes."
    echo ""
    echo "After restart, the device should be available at:"
    echo "  $DEVICE_URL"
    echo ""
    echo "Please wait 2 minutes before accessing the device."
else
    echo "❌ Upload failed with HTTP code: $HTTP_CODE"
    echo "Response: $RESPONSE_BODY"
    exit 1
fi

echo ""
echo "═══════════════════════════════════════════════════════════"
