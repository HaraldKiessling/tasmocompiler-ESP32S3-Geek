#!/usr/bin/env node

const io = require('socket.io-client');
const axios = require('axios');

const API_URL = 'http://localhost:3000';

// Configuration for ESP32 LVGL firmware v15.0.1
const compileConfig = {
  version: 'v15.0.1',
  board: 'esp32s3',
  features: {
    lvgl: true,
    berry: true,
    ufilesys: true,
    rules: true,
    USE_I2C: true,
    USE_SPI: true,
    USE_ENERGY_SENSOR: true,
    common_displays: true,
  },
  network: {
    STA_SSID1: '',
    STA_PASS1: '',
    WIFI_IP_ADDRESS: '',
    WIFI_GATEWAY: '',
    WIFI_SUBNETMASK: '',
    WIFI_DNS: '',
  },
  language: 'en-GB',
  customParams: '#undef SET_ESP32_STACK_SIZE\n#define SET_ESP32_STACK_SIZE (24 * 1024)\n',
};

async function main() {
  console.log('Connecting to TasmoCompiler...');
  
  // Connect to WebSocket for compilation messages
  const socket = io(API_URL);
  
  socket.on('connect', () => {
    console.log('Connected to TasmoCompiler WebSocket');
  });
  
  socket.on('message', (msg) => {
    process.stdout.write(msg);
  });
  
  socket.on('disconnect', () => {
    console.log('\nDisconnected from TasmoCompiler');
  });

  // Wait for connection
  await new Promise(resolve => setTimeout(resolve, 1000));

  try {
    // Check if repo is available
    console.log('\nChecking repository availability...');
    const repoCheck = await axios.get(`${API_URL}/api/v1/repoavailability`);
    
    if (!repoCheck.data.result) {
      console.log('Repository not available, cloning...');
      await axios.get(`${API_URL}/api/v1/clonerepo`);
      console.log('Repository cloned successfully');
    } else {
      console.log('Repository available');
    }

    // Get available tags
    console.log('\nFetching available Tasmota versions...');
    const tagsResponse = await axios.get(`${API_URL}/api/v1/repotags`);
    const tags = tagsResponse.data.tags;
    
    if (!tags.includes(compileConfig.version)) {
      console.log(`\nWarning: Version ${compileConfig.version} not found in available tags.`);
      console.log('Available versions:', tags.slice(0, 10).join(', '), '...');
      console.log(`Using latest available version: ${tags[0]}`);
      compileConfig.version = tags[0];
    } else {
      console.log(`Version ${compileConfig.version} found`);
    }

    // Start compilation
    console.log(`\nStarting compilation for ESP32 S3 with LVGL support (${compileConfig.version})...`);
    console.log('Board: ESP32 S3');
    console.log('Features: LVGL, Berry, File System, Rules\n');
    
    const compileResponse = await axios.post(`${API_URL}/api/v1/compile`, compileConfig);
    
    if (compileResponse.data.ok) {
      console.log('\nCompilation started successfully!');
      console.log('Watch the output above for compilation progress...');
      console.log('\nOnce complete, firmware files will be available at:');
      console.log(`- ${API_URL}/download/firmware.bin`);
      console.log(`- ${API_URL}/download/platformio_override.ini`);
      console.log(`- ${API_URL}/download/user_config_override.h`);
    } else {
      console.error('Failed to start compilation:', compileResponse.data);
      process.exit(1);
    }

  } catch (error) {
    console.error('Error:', error.message);
    if (error.response) {
      console.error('Response:', error.response.data);
    }
    process.exit(1);
  }

  // Keep the script running to receive WebSocket messages
  console.log('\nWaiting for compilation to complete (this may take several minutes)...');
  console.log('Press Ctrl+C to exit\n');
}

main();
