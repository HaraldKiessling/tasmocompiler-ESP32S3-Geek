#!/bin/bash
# Tasmota-77 Configuration Script
# Device: ESP32-S3 with DS18B20 temperature sensors and BME280
# Generated: 2026-01-10
# Source device: tasmota-77.samharald.eu (192.168.0.77)
#
# Usage:
#   ./setup-tasmota-77.sh [DEVICE_IP] [WIFI_SSID] [WIFI_PASSWORD] [HOSTNAME] [MQTT_HOST]
#
# Examples:
#   # Configure only network settings
#   ./setup-tasmota-77.sh 192.168.0.100
#
#   # Configure WiFi
#   ./setup-tasmota-77.sh 192.168.0.100 "MyWiFi" "MyPassword"
#
#   # Configure WiFi and hostname
#   ./setup-tasmota-77.sh 192.168.0.100 "MyWiFi" "MyPassword" "tasmota-sensor-01"
#
#   # Full configuration with MQTT
#   ./setup-tasmota-77.sh 192.168.0.100 "MyWiFi" "MyPassword" "tasmota-sensor-01" "192.168.0.50"

# Parse command line parameters
DEVICE_IP="${1:-192.168.0.77}"
WIFI_SSID="${2:-}"
WIFI_PASSWORD="${3:-}"
HOSTNAME="${4:-}"
MQTT_HOST="${5:-}"

# Default configuration (from source device)
DEFAULT_DEVICE_NAME="Tasmota-77"
DEFAULT_HOSTNAME="tasmota-C6D100-4352"
DEFAULT_TOPIC="tasmota_C6D100"
DEFAULT_MQTT_CLIENT="DVES_C6D100"

BASE_URL="http://${DEVICE_IP}"

echo "=========================================="
echo "Tasmota Configuration Script"
echo "=========================================="
echo "Device IP: ${DEVICE_IP}"
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
send_cmd "DeviceName%20${DEFAULT_DEVICE_NAME}"
send_cmd "FriendlyName%20${DEFAULT_DEVICE_NAME}"
send_cmd "Topic%20${DEFAULT_TOPIC}"

if [ -n "$HOSTNAME" ]; then
    echo "Setting custom hostname: ${HOSTNAME}"
    send_cmd "Hostname%20${HOSTNAME}"
else
    echo "Using default hostname: ${DEFAULT_HOSTNAME}"
    send_cmd "Hostname%20${DEFAULT_HOSTNAME}"
fi

# WiFi Configuration
echo ""
echo "=== WiFi Configuration ==="
if [ -n "$WIFI_SSID" ] && [ -n "$WIFI_PASSWORD" ]; then
    echo "Configuring WiFi: ${WIFI_SSID}"
    send_cmd "SSId1%20${WIFI_SSID}"
    send_cmd "Password1%20${WIFI_PASSWORD}"
else
    echo "⚠️  WiFi not configured (no SSID/password provided)"
    echo "   Current SSID: miVida2"
    echo "   To configure: ./setup-tasmota-77.sh ${DEVICE_IP} \"YourSSID\" \"YourPassword\""
fi

# MQTT Configuration
echo ""
echo "=== MQTT Configuration ==="
send_cmd "MqttClient%20${DEFAULT_MQTT_CLIENT}"
send_cmd "MqttUser%20DVES_USER"

if [ -n "$MQTT_HOST" ]; then
    echo "Configuring MQTT broker: ${MQTT_HOST}"
    send_cmd "MqttHost%20${MQTT_HOST}"
    send_cmd "MqttPort%201883"
else
    echo "⚠️  MQTT broker not configured"
    echo "   To configure: ./setup-tasmota-77.sh ${DEVICE_IP} \"SSID\" \"Pass\" \"hostname\" \"mqtt.broker.ip\""
fi

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
echo "This device supports up to 10 DS18B20 temperature sensors."
echo "Currently configured sensors (from source device):"
echo "  - DS18B20-1: ID 0000005329E2 (21.9°C)"
echo "  - DS18B20-2: ID 00000051C76D (22.1°C)"
echo "  - DS18B20-3: (ready for additional sensor)"
echo ""
echo "Additional sensors:"
echo "  - BME280: Temperature, Humidity, Pressure (I2C)"
echo ""
echo "Temperature unit: Celsius"
echo ""
echo "Note: Sensors are auto-detected. Connect DS18B20 sensors to GPIO pin"
echo "      configured in template. The display (autoexec.be) supports up to"
echo "      10 DS18B20 sensors and will show them automatically."

# Final save and restart
echo ""
echo "=== Finalizing Configuration ==="
send_cmd "SaveData%201"
echo ""
echo "=========================================="
echo "✅ Configuration complete!"
echo "=========================================="
echo ""
echo "Device information:"
echo "  Name: ${DEFAULT_DEVICE_NAME}"
echo "  Hostname: ${HOSTNAME:-$DEFAULT_HOSTNAME}"
echo "  Topic: ${DEFAULT_TOPIC}"
echo "  WiFi SSID: ${WIFI_SSID:-miVida2 (unchanged)}"
echo "  MQTT Host: ${MQTT_HOST:-not configured}"
echo "  IP Address: ${DEVICE_IP}"
echo ""
echo "Next steps:"
echo "  1. Restart device: curl -s '${BASE_URL}/cm?cmnd=Restart%201'"
echo "  2. Web interface: http://${DEVICE_IP}"
echo "  3. Upload display files (autoexec.be, pages.jsonl) if needed"
echo ""
echo "Display configuration:"
echo "  - autoexec.be: Main display logic with sensor dashboard"
echo "  - pages.jsonl: Display layout definition"
echo "  - Upload via: Consoles -> Manage File System"
echo ""
