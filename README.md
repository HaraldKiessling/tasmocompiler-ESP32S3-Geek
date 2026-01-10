![Docker Pulls](https://img.shields.io/docker/pulls/benzino77/tasmocompiler)
[![donate](https://img.shields.io/badge/donate-PayPal-brightgreen.svg)](https://www.paypal.me/tasmocompiler)
[![donate](https://img.shields.io/badge/donate-KoFi-brightgreen.svg)](https://ko-fi.com/benzino77)
![Twitter URL](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2Fbenzino77%2Ftasmocompiler)

<!-- ![Logo](./docs/logo/tasmocompiler-full.svg) -->

<div align="center">
  <img src="./docs/logo/tasmocompiler-full.svg" width="40%">
</div>

---

## 🎯 ESP32-S3-Geek Firmware Download

**Latest Pre-compiled Firmware (v15.0.1 - 2026-01-10):**

### 🆕 Enhanced Version with BME280 & LittleFS (Recommended)

**Build Date:** 2026-01-10 13:52 UTC  
**Size:** 2.7 MB (2,790,256 Bytes)  
**MD5:** `0ecc46e94126d688305535f095582ef6`

#### Quick Download

```bash
# Direct download via curl
curl -L -o tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin"

# Or via wget
wget https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

#### OTA Update (Direct from GitHub)

```
Backlog OtaUrl https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin; Upgrade 1
```

#### Local Path in Repository

```
firmware-releases/tasmota32s3-v15.0.1-ESP32-S3-Geek-BME280-LittleFS.bin
```

**Features:**
- ✅ **10x DS18x20** Temperature Sensors (1-Wire)
- ✅ **BME280** Environmental Sensor (I2C) - Temp, Humidity, Pressure
- ✅ **ST7789V Display** (240x135) with LVGL v9.3.0
- ✅ **CST816S Touch** Controller
- ✅ **LittleFS** Filesystem (320 KB)
- ✅ **Berry** Scripting Engine
- ✅ **Matter/Thread** Support
- ✅ **MQTT** Client
- ✅ **OTA** Updates

**Tested on:**
- ✅ Tasmota-75 (2x BME280) - All functions working
- ✅ Tasmota-77 (3x DS18B20) - Ready for deployment

---

### 📦 Previous Versions

#### LVGL Version (2.1 MB)
```bash
curl -L -o tasmota32s3-lvgl.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-lvgl-v15.0.1-ESP32S3-Geek-10xDS18x20.bin"
```

#### Matter-HA Version (2.7 MB)
```bash
curl -L -o tasmota32s3-matter-ha.bin \
  "https://raw.githubusercontent.com/HaraldKiessling/tasmocompiler-ESP32S3-Geek/tasmota-esp32s3-lvgl-v15.0.1/tasmota32s3-v15.0.1-Matter-HA-BME280-fixed.bin"
```

---

### 📖 Documentation

**📦 [FIRMWARE-INDEX.md](FIRMWARE-INDEX.md) - Complete Firmware Index**
- All firmware versions and download links
- Version comparison
- MD5 checksums
- Documentation index

**New Documentation (2026-01-10):**
- 🔗 [QUICK-LINKS.md](QUICK-LINKS.md) - Quick access to all links
- 📥 [FIRMWARE-DIRECT-DOWNLOAD.md](FIRMWARE-DIRECT-DOWNLOAD.md) - Direct download links & verification
- 🔄 [FIRMWARE-DOWNLOAD-LINKS.md](FIRMWARE-DOWNLOAD-LINKS.md) - OTA update methods
- 📘 [WAVESHARE-ESP32-S3-GEEK-GUIDE.md](WAVESHARE-ESP32-S3-GEEK-GUIDE.md) - Complete guide
- 📊 [DEPLOYMENT-SUMMARY.md](DEPLOYMENT-SUMMARY.md) - Deployment summary
- 📦 [README-DEPLOYMENT.md](README-DEPLOYMENT.md) - Package overview

**Previous Documentation:**
- 📥 [FIRMWARE_DOWNLOAD.md](FIRMWARE_DOWNLOAD.md) - Complete download guide
- 🚀 [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) - Installation instructions
- ⚙️ [SETUP_TASMOTA_77.md](SETUP_TASMOTA_77.md) - Configuration guide
- 🎨 [DISPLAY_CONFIG.md](DISPLAY_CONFIG.md) - Display customization
- 📊 [FIRMWARE_OPTIMIZATION.md](FIRMWARE_OPTIMIZATION.md) - Optimization details

---

## 📋 Project Overview

This repository contains a complete Tasmota firmware solution for the **ESP32-S3-Geek** development board with LVGL display, optimized for temperature monitoring with multiple DS18B20 sensors and BME280 environmental sensor.

### Key Features
- ✅ **Pre-compiled Firmware**: Ready-to-use LVGL v15.0.1 (2.1 MB)
- ✅ **Optimized Configuration**: Reduced firmware size (100-700 KB savings)
- ✅ **Automated Setup**: One-command configuration script
- ✅ **Display Dashboard**: Berry-scripted sensor display with real-time updates
- ✅ **Security**: No pre-configured WiFi credentials
- ✅ **GPIO Template**: Pre-configured for ESP32-S3-Geek hardware
- ✅ **Comprehensive Documentation**: 22+ documentation files

### Hardware Support
- **Board**: ESP32-S3-Geek (Waveshare)
- **Display**: ST7789 TFT 320x240 with CST816S touch
- **Sensors**: Up to 10x DS18B20 + BME280 (I2C)
- **Flash**: 16 MB
- **PSRAM**: 8 MB

### Quick Links
- 📥 [Download Firmware](FIRMWARE_DOWNLOAD.md)
- 🚀 [Installation Guide](DEPLOYMENT_GUIDE.md)
- ⚙️ [Setup Instructions](SETUP_TASMOTA_77.md)
- 🎨 [Display Configuration](DISPLAY_CONFIG.md)
- 📊 [Optimization Details](FIRMWARE_OPTIMIZATION.md)

---

#### What it is?

TasmoCompiler is a simple web GUI which allows you to compile fantastic [Tasmota](https://github.com/arendst/Sonoff-Tasmota) firmware with your own settings:

- You can select which board you are building firmware for
- You can select which features/sensors of Tasmota firmware you want to use (description of available features can be found in [FEATURES DESCRIPTION](https://github.com/benzino77/tasmocompiler/blob/master/FEATURES_DESC.md) file)
- Credentials for your IOT WiFi network, so even after unexpected problems with the device (complete lost of configuration), credentials for your network will still be there, but mainly you don't have to connect to AP, served by Tasmota to configure your Home WiFi
- You can select Tasmota version you want to compile. You can select `development` bleading edge version, or latest stable release if this is the one you like
- Language of Tasmota GUI interface
- You can also provide custom `#defines` if you want to build even more suitable firmaware for your needs

#### Why?

Well, there are two reasons. First is that I want to build my first application written in NodeJS/React. The second one is based on the observation that everytime I prepare a new device I have to start atom with platformio installed, configure all `#defines` (well, I have template which I copy) and prepare `platformio.ini`, create a branch from version I like to use, etc..

That's why I decided to prepare a solution which is easier to use (just a few clicks) and does not require knowledge how to install dev environment to build custom firmware.

#### How it works?

The easiest way is to look at the screenshots (the whole process is five steps only). After compilation you will be able to download four (or three for ESP32 boards) files:

1. Your new `firmware.bin` file, which can be uploaded to your device via Tasmota WebGUI, espotool, ESPEasy flasher or any other tool you used to use to flash your device
2. Compressed file `firmware.bin.gz` (not available for ESP32 boards)
3. `platformio_override.ini` file, to check what options for platformio were used to compile the custom firmware file
4. `user_config_override.h` file to check what features are included/excluded from resulting firmware

The links to download these files will show up under _Compiling progress_ field (look at the bottom of the last screenshot). **These links will show up only when compilation is successful**.

You have to upload only `firmware.bin` or `firmware.bin.gz` file to your device. How to do that is perfeclty described on [Tasmota docs](https://tasmota.github.io/docs/Upgrading/).

![Step01](./docs/images/step01.png)
![Step02](./docs/images/step02.png)
![Step03](./docs/images/step03.png)
![Step04](./docs/images/step04.png)
![Step05](./docs/images/step05.png)
![Compile01](./docs/images/compile01.png)

#### How to start using TasmoCompiler?

##### Easy way

Start TasmoCompiler in docker:

`docker pull benzino77/tasmocompiler`

`docker run --rm --name tasmocompiler -p 3000:3000 benzino77/tasmocompiler`

Then point your browser to http://localhost:3000

If you want to see debug messages on docker console you can run a container with env variable:

`docker run --rm --name tasmocompiler -p 3000:3000 -e DEBUG=server,git,compile benzino77/tasmocompiler`

- `server` to see http server messages
- `git` to see git operation messages
- `compile` to see messages during compilation

You can also specify different port on which TasmoCompiler will be available on the host:

`docker run --rm --name tasmocompiler -p 8080:3000 benzino77/tasmocompiler`

Then point your browser to http://localhost:8080

##### Less easy way

1. Install `NodeJS` and `Python 3.6.x` or later
2. Install [`yarn`](https://yarnpkg.com/en/docs/install)
3. Install [`platformio`](https://docs.platformio.org/en/latest/installation.html)
4. Clone/download the repository from github and change directory to the cloned repo
5. run `yarn install`
6. run `yarn build`
7. run `node server/app.js`
8. point your browser to http://localhost:3000

#### How to use "Custom parameters"?

The configuration options are limited on purpose. I don't want to _overload_ the GUI with too many options. But there is _Custom prameters_ step which allows you to define other Tasmota parameters. Let's say you want to define your MQTT broker and credentials for it. You have to put these lines in _Custom parameters_ field:

```C++
#ifdef MQTT_HOST
  #undef MQTT_HOST
#endif
#define MQTT_HOST               "mqtt.yourhost.iot"

#ifdef MQTT_PORT
  #undef MQTT_PORT
#endif
#define MQTT_PORT               1883

#ifdef MQTT_USER
  #undef MQTT_USER
#endif
#define MQTT_USER            "mqttuser"

#ifdef MQTT_PASS
  #undef MQTT_PASS
#endif
#define MQTT_PASS            "mqttpassword"
```

To define _Friendly name_ for your device you have to put these lines in _Custom parametrs_ field:

```C++
#ifdef FRIENDLY_NAME
  #undef FRIENDLY_NAME
#endif
#define FRIENDLY_NAME          "Watering controller"

```

Let's assume that you want to _compile in_ information about your ntp server, your time zone and location (this is used by timers for events like _sunrise/sunset_). You can do this by putting these lines in _Custom parameters_ field:

```C++
#ifdef NTP_SERVER1
  #undef NTP_SERVER1
#endif
#define NTP_SERVER1             "ntp.yourserver.iot"

#ifdef LATITUDE
  #undef LATITUDE
#endif
#define LATITUDE               34.4348

#ifdef LONGITUDE
  #undef LONGITUDE
#endif
#define LONGITUDE              10.0508

#ifdef APP_TIMEZONE
  #undef APP_TIMEZONE
#endif
#define APP_TIMEZONE           99
```

You can find additional information what can be set by _Custom parameters_ field in [my_user_config.h](https://github.com/arendst/Tasmota/blob/development/tasmota/my_user_config.h) in Tasmota source code.

#### Troubleshooting and advanced usage

If you have problems with the compiler or you are interested in more advance usage, please refer to the [ADVANCED](https://github.com/benzino77/tasmocompiler/blob/master/ADVANCED.md) tips for more information.

#### Development version

There is a TasmoCompiler branch which tries to follow as much as possible changes made to `development` branch of Tasmota. It is bleeding edge version so you can expect unexpected. To use `development` pull and run appropriate docker image:

`docker run --rm --name tasmocompiler -p 3000:3000 benzino77/tasmocompiler:development`

#### Disclaimer

Everything you do, you do on your own responsibility. I do not take any responsibility for damages or problems, that may arise as a result of using this solution or its products.

##### Credits

Thanks to [Theo Arends](https://github.com/arendst) and the entire Tasmota Dev Team for fantastic work!

#### License

TasmoCompiler is licensed under the [MIT license](LICENSE).
