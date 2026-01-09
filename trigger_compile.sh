#!/bin/bash

echo "Triggering ESP32 S3 LVGL firmware compilation for Tasmota v15.0.1..."

curl -X POST http://localhost:3000/api/v1/compile \
  -H "Content-Type: application/json" \
  -d '{
    "version": "v15.0.1",
    "board": "esp32s3",
    "features": {
      "lvgl": true,
      "berry": true,
      "ufilesys": true,
      "rules": true,
      "USE_I2C": true,
      "USE_SPI": true,
      "USE_ENERGY_SENSOR": true,
      "common_displays": true
    },
    "network": {
      "STA_SSID1": "",
      "STA_PASS1": "",
      "WIFI_IP_ADDRESS": "",
      "WIFI_GATEWAY": "",
      "WIFI_SUBNETMASK": "",
      "WIFI_DNS": ""
    },
    "language": "en-GB",
    "customParams": "#undef SET_ESP32_STACK_SIZE\n#define SET_ESP32_STACK_SIZE (24 * 1024)\n"
  }'

echo ""
echo ""
echo "Compilation started! This will take several minutes..."
echo "You can monitor the compilation by checking the server logs."
echo ""
echo "Once complete, firmware will be available at:"
echo "  - http://localhost:3000/download/firmware.bin"
echo "  - http://localhost:3000/download/platformio_override.ini"
echo "  - http://localhost:3000/download/user_config_override.h"
