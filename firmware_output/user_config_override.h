#ifndef _USER_CONFIG_OVERRIDE_H_
#define _USER_CONFIG_OVERRIDE_H_

// ESP32-S3-Geek Optimized Configuration
// Generated from compile_request_optimized.json

// Stack size
#undef SET_ESP32_STACK_SIZE
#define SET_ESP32_STACK_SIZE (24 * 1024)

// DS18x20 sensors
#undef DS18X20_MAX_SENSORS
#define DS18X20_MAX_SENSORS 10
#define USE_DS18x20

// BME280 sensor
#define USE_BME280

// GPIO Template for ESP32-S3-Geek
#define USER_TEMPLATE "{\"NAME\":\"ESP32S3-Geek\",\"GPIO\":[32,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,640,608,0,0,0,0,8896,8960,8800,8832,8864,8928,0,6210,0,0,3200,3232,0,0,0,0],\"FLAG\":0,\"BASE\":1}"
#define MODULE 0
#define FALLBACK_MODULE 0

// Firmware version suffix
#define FIRMWARE_VERSION_SUFFIX "-ESP32S3-Geek-Optimized"

// Display and Touch
#define USE_LVGL
#define USE_DISPLAY
#define USE_UNIVERSAL_DISPLAY
#define USE_UNIVERSAL_TOUCH
#define USE_CST816S
#define USE_DISPLAY_LVGL_ONLY

// Communication
#define USE_I2C
#define USE_SPI

// Scripting and File System
#define USE_BERRY
#define USE_UFILESYS
#define USE_RULES

// WiFi
#define USE_ENHANCED_GUI_WIFI_SCAN

// Disable unnecessary modules
#undef USE_ENERGY_SENSOR
#undef USE_MPU_ACCEL
#undef USE_RTC_CHIPS
#undef USE_BM8563
#undef USE_XPT2046
#undef USE_FT5206
#undef USE_GT911
#undef ROTARY_V1
#undef USE_BUZZER
#undef USE_LIGHT_PALETTE
#undef USE_SHELLY_PRO
#undef USE_SERIAL_BRIDGE

#endif  // _USER_CONFIG_OVERRIDE_H_
