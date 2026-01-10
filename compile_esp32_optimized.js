#!/usr/bin/env node

const io = require('socket.io-client');
const axios = require('axios');
const fs = require('fs');

const API_URL = 'http://localhost:3000';

// Load optimized configuration
const configFile = './compile_request_optimized.json';
let compileConfig;

try {
  const configData = fs.readFileSync(configFile, 'utf8');
  compileConfig = JSON.parse(configData);
  console.log(`✅ Loaded configuration from ${configFile}`);
} catch (error) {
  console.error(`❌ Error loading configuration file: ${error.message}`);
  process.exit(1);
}

// Convert configuration format for API
const apiConfig = {
  version: compileConfig.version.tasmotaVersion,
  board: compileConfig.board,
  features: compileConfig.features,
  network: compileConfig.network,
  language: compileConfig.language,
  customParams: compileConfig.customParams,
};

async function main() {
  console.log('==========================================');
  console.log('ESP32-S3-Geek Optimized Firmware Compiler');
  console.log('==========================================\n');
  
  console.log('Configuration:');
  console.log(`  Version: ${apiConfig.version}`);
  console.log(`  Board: ${apiConfig.board}`);
  console.log(`  Features: LVGL, Berry, File System, Rules, I2C, SPI`);
  console.log(`  Optimized: Energy Sensor, MPU, RTC, etc. removed`);
  console.log(`  Expected size: ~1.9-2.0 MB\n`);
  
  console.log('Connecting to TasmoCompiler...');
  
  // Connect to WebSocket for compilation messages
  const socket = io(API_URL);
  
  socket.on('connect', () => {
    console.log('✅ Connected to TasmoCompiler WebSocket\n');
  });
  
  socket.on('message', (msg) => {
    process.stdout.write(msg);
  });
  
  socket.on('disconnect', () => {
    console.log('\n⚠️  Disconnected from TasmoCompiler');
  });

  // Wait for connection
  await new Promise(resolve => setTimeout(resolve, 1000));

  try {
    // Check if repo is available
    console.log('Checking repository availability...');
    const repoCheck = await axios.get(`${API_URL}/api/v1/repoavailability`);
    
    if (!repoCheck.data.result) {
      console.log('Repository not available, cloning...');
      await axios.get(`${API_URL}/api/v1/clonerepo`);
      console.log('✅ Repository cloned successfully\n');
    } else {
      console.log('✅ Repository available\n');
    }

    // Get available tags
    console.log('Fetching available Tasmota versions...');
    const tagsResponse = await axios.get(`${API_URL}/api/v1/repotags`);
    const tags = tagsResponse.data.tags;
    
    if (!tags.includes(apiConfig.version)) {
      console.log(`⚠️  Warning: Version ${apiConfig.version} not found in available tags.`);
      console.log('Available versions:', tags.slice(0, 10).join(', '), '...');
      console.log(`Using latest available version: ${tags[0]}`);
      apiConfig.version = tags[0];
    } else {
      console.log(`✅ Version ${apiConfig.version} found\n`);
    }

    // Start compilation
    console.log('==========================================');
    console.log('Starting Compilation');
    console.log('==========================================\n');
    console.log(`Version: ${apiConfig.version}`);
    console.log('Board: ESP32-S3');
    console.log('Profile: Optimized (100-700 KB smaller)');
    console.log('');
    console.log('Enabled Features:');
    console.log('  ✅ LVGL Display');
    console.log('  ✅ CST816S Touch');
    console.log('  ✅ DS18B20 (up to 10 sensors)');
    console.log('  ✅ BME280 (I2C)');
    console.log('  ✅ Berry Scripting');
    console.log('  ✅ File System');
    console.log('  ✅ Rules Engine');
    console.log('');
    console.log('Disabled Features:');
    console.log('  ❌ Energy Sensor');
    console.log('  ❌ Accelerometer (MPU)');
    console.log('  ❌ RTC Chips');
    console.log('  ❌ Unused Touch Controllers');
    console.log('  ❌ Rotary Encoder');
    console.log('  ❌ Buzzer');
    console.log('  ❌ Light Palette');
    console.log('  ❌ Shelly Pro');
    console.log('  ❌ Serial Bridge');
    console.log('');
    
    const compileResponse = await axios.post(`${API_URL}/api/v1/compile`, apiConfig);
    
    if (compileResponse.data.ok) {
      console.log('✅ Compilation started successfully!\n');
      console.log('==========================================');
      console.log('Compilation Progress');
      console.log('==========================================\n');
      console.log('Watch the output below for compilation progress...\n');
      console.log('Once complete, firmware files will be available at:');
      console.log(`  📥 ${API_URL}/download/firmware.bin`);
      console.log(`  📄 ${API_URL}/download/platformio_override.ini`);
      console.log(`  📄 ${API_URL}/download/user_config_override.h`);
      console.log('');
      console.log('Download command:');
      console.log(`  curl -o tasmota32s3-v15.0.1-ESP32S3-Geek-Optimized.bin ${API_URL}/download/firmware.bin`);
      console.log('');
    } else {
      console.error('❌ Failed to start compilation:', compileResponse.data);
      process.exit(1);
    }

  } catch (error) {
    console.error('❌ Error:', error.message);
    if (error.response) {
      console.error('Response:', error.response.data);
    }
    console.error('\n⚠️  Make sure TasmoCompiler server is running:');
    console.error('  cd /workspaces/tasmocompiler');
    console.error('  PORT=3001 DEBUG="server,git,compile" node server/app.js');
    process.exit(1);
  }

  // Keep the script running to receive WebSocket messages
  console.log('⏳ Waiting for compilation to complete (this may take 5-10 minutes)...');
  console.log('Press Ctrl+C to exit\n');
  console.log('==========================================\n');
}

main();
