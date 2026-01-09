#ifndef _USER_CONFIG_OVERRIDE_H_
#define _USER_CONFIG_OVERRIDE_H_

// ESP32 S3 LVGL Configuration for Tasmota v15.0.1

// WiFi Configuration
#ifdef STA_SSID1
  #undef STA_SSID1
#endif
#define STA_SSID1	"miVida2"

#ifdef STA_PASS1
  #undef STA_PASS1
#endif
#define STA_PASS1	"m1Curaz#n"

// LVGL Support
#ifdef USE_LVGL
  #undef USE_LVGL
#endif
#define USE_LVGL

#ifdef USE_DISPLAY
  #undef USE_DISPLAY
#endif
#define USE_DISPLAY

#ifdef USE_UNIVERSAL_DISPLAY
  #undef USE_UNIVERSAL_DISPLAY
#endif
#define USE_UNIVERSAL_DISPLAY

#ifdef USE_UNIVERSAL_TOUCH
  #undef USE_UNIVERSAL_TOUCH
#endif
#define USE_UNIVERSAL_TOUCH

// Touch and Display Controllers
#ifdef USE_XPT2046
  #undef USE_XPT2046
#endif
#define USE_XPT2046

#ifdef USE_FT5206
  #undef USE_FT5206
#endif
#define USE_FT5206

#ifdef USE_GT911
  #undef USE_GT911
#endif
#define USE_GT911

#ifdef USE_CST816S
  #undef USE_CST816S
#endif
#define USE_CST816S

// RTC Support
#ifdef USE_RTC_CHIPS
  #undef USE_RTC_CHIPS
#endif
#define USE_RTC_CHIPS

#ifdef USE_BM8563
  #undef USE_BM8563
#endif
#define USE_BM8563

// Accelerometer
#ifdef USE_MPU_ACCEL
  #undef USE_MPU_ACCEL
#endif
#define USE_MPU_ACCEL

// Display Settings
#ifdef USE_DISPLAY_LVGL_ONLY
  #undef USE_DISPLAY_LVGL_ONLY
#endif
#define USE_DISPLAY_LVGL_ONLY

// Enhanced WiFi Scan
#ifdef USE_ENHANCED_GUI_WIFI_SCAN
  #undef USE_ENHANCED_GUI_WIFI_SCAN
#endif
#define USE_ENHANCED_GUI_WIFI_SCAN

// Rotary Encoder
#ifdef ROTARY_V1
  #undef ROTARY_V1
#endif
#define ROTARY_V1

// Buzzer Support
#ifdef USE_BUZZER
  #undef USE_BUZZER
#endif
#define USE_BUZZER

// Light Palette
#ifdef USE_LIGHT_PALETTE
  #undef USE_LIGHT_PALETTE
#endif
#define USE_LIGHT_PALETTE

// Shelly Pro Support
#ifdef USE_SHELLY_PRO
  #undef USE_SHELLY_PRO
#endif
#define USE_SHELLY_PRO

// Serial Bridge
#ifdef USE_SERIAL_BRIDGE
  #undef USE_SERIAL_BRIDGE
#endif
#define USE_SERIAL_BRIDGE

// I2C Support
#ifdef USE_I2C
  #undef USE_I2C
#endif
#define USE_I2C

// SPI Support
#ifdef USE_SPI
  #undef USE_SPI
#endif
#define USE_SPI

// Energy Sensor
#ifdef USE_ENERGY_SENSOR
  #undef USE_ENERGY_SENSOR
#endif
#define USE_ENERGY_SENSOR

// Berry Scripting
#ifdef USE_BERRY
  #undef USE_BERRY
#endif
#define USE_BERRY

// File System
#ifdef USE_UFILESYS
  #undef USE_UFILESYS
#endif
#define USE_UFILESYS

// Rules
#ifdef USE_RULES
  #undef USE_RULES
#endif
#define USE_RULES

// ESP32 Stack Size for LVGL
#undef SET_ESP32_STACK_SIZE
#define SET_ESP32_STACK_SIZE (24 * 1024)

// DS18X20 Temperature Sensors - Increase limit from 8 to 10
#ifdef DS18X20_MAX_SENSORS
  #undef DS18X20_MAX_SENSORS
#endif
#define DS18X20_MAX_SENSORS 10

// Enable DS18x20 sensor support
#ifdef USE_DS18x20
  #undef USE_DS18x20
#endif
#define USE_DS18x20

#endif
