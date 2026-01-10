#!/bin/bash
# Tasmota-77 Configuration Script
# Device: ESP32-S3 with DS18B20 temperature sensors
# Generated: 2026-01-10
# Source device: tasmota-77.samharald.eu (192.168.0.77)

# Configuration extracted from running device
DEVICE_NAME="Tasmota-77"
HOSTNAME="tasmota-C6D100-4352"
TOPIC="tasmota_C6D100"
MQTT_CLIENT="DVES_C6D100"
WIFI_SSID="miVida2"
WIFI_PASSWORD=""  # Set your WiFi password here

# Device IP (if you want to configure via HTTP)
DEVICE_IP="${1:-192.168.0.77}"
BASE_URL="http://${DEVICE_IP}"

echo "Configuring Tasmota device at ${DEVICE_IP}..."
echo "Device: ${DEVICE_NAME}"
echo ""

# Function to send command to Tasmota
send_cmd() {
    local cmd="$1"
    echo "Sending: $cmd"
    curl -s "${BASE_URL}/cm?cmnd=${cmd}" | python3 -m json.tool 2>/dev/null || echo "Command sent"
    sleep 0.5
}

# Basic device configuration
echo "=== Basic Configuration ==="
send_cmd "DeviceName%20${DEVICE_NAME}"
send_cmd "FriendlyName%20${DEVICE_NAME}"
send_cmd "Topic%20${TOPIC}"
send_cmd "Hostname%20${HOSTNAME}"

# WiFi Configuration
echo ""
echo "=== WiFi Configuration ==="
if [ -n "$WIFI_PASSWORD" ]; then
    send_cmd "SSId1%20${WIFI_SSID}"
    send_cmd "Password1%20${WIFI_PASSWORD}"
else
    echo "⚠️  WiFi password not set - skipping WiFi configuration"
    echo "   Set WIFI_PASSWORD variable or configure manually"
fi

# MQTT Configuration
echo ""
echo "=== MQTT Configuration ==="
send_cmd "MqttClient%20${MQTT_CLIENT}"
send_cmd "MqttUser%20DVES_USER"
# Note: MQTT host is not configured on source device
echo "⚠️  MQTT host not configured - set with: MqttHost <your_mqtt_broker>"

# Power and LED settings
echo ""
echo "=== Power and LED Settings ==="
send_cmd "PowerOnState%203"  # Restore last state
send_cmd "LedState%201"      # Show power state
send_cmd "SaveData%201"      # Save to flash every second
send_cmd "SaveState%201"     # Save power state

# Network settings
echo ""
echo "=== Network Settings ==="
send_cmd "WifiConfig%204"    # Retry other AP without restart
send_cmd "WifiPower%2019.0"  # WiFi power 19.0 dBm
send_cmd "Webserver%202"     # Enable web server with admin mode
send_cmd "WebLog%202"        # Web log level 2

# Logging settings
echo ""
echo "=== Logging Settings ==="
send_cmd "SerialLog%202"     # Serial log level 2
send_cmd "TelePeriod%20300"  # Telemetry period 300 seconds

# Time and location settings
echo ""
echo "=== Time Settings ==="
send_cmd "Timezone%20%2B01:00"  # UTC+1
send_cmd "TimeStd%200,0,10,1,3,60"  # Standard time (winter)
send_cmd "TimeDst%200,0,3,1,2,120"  # Daylight saving time (summer)

# DS18B20 Temperature sensor settings
echo ""
echo "=== Sensor Configuration ==="
echo "DS18B20 sensors detected:"
echo "  - Sensor 1: ID 0000005329E2"
echo "  - Sensor 2: ID 00000051C76D"
echo "Temperature unit: Celsius"

# Final save and restart
echo ""
echo "=== Finalizing Configuration ==="
send_cmd "SaveData%201"
echo ""
echo "✅ Configuration complete!"
echo ""
echo "Device information:"
echo "  Name: ${DEVICE_NAME}"
echo "  Hostname: ${HOSTNAME}"
echo "  Topic: ${TOPIC}"
echo "  WiFi SSID: ${WIFI_SSID}"
echo "  IP Address: ${DEVICE_IP}"
echo ""
echo "To restart the device, run:"
echo "  curl -s '${BASE_URL}/cm?cmnd=Restart%201'"
echo ""
echo "To access the web interface:"
echo "  http://${DEVICE_IP}"
