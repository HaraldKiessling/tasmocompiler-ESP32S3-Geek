#!/usr/bin/env python3
import requests
import time
import urllib.parse
import warnings
warnings.filterwarnings('ignore')

BASE = "https://tasmota-77.samharald.eu/cm?cmnd="

with open('autoexec_ultra.be', 'r') as f:
    content = f.read()

# Lösche alte Dateien
for fname in ['autoexec.be', 'pages.jsonl']:
    cmd = f"Br import path path.remove('{fname}')"
    requests.get(BASE + urllib.parse.quote(cmd), verify=False, timeout=5)
    time.sleep(0.3)

# Erstelle neue Datei
cmd = "Br var f=open('autoexec.be','w') f.close()"
requests.get(BASE + urllib.parse.quote(cmd), verify=False, timeout=5)
time.sleep(0.5)

# Schreibe in Chunks
chunk_size = 150
for i in range(0, len(content), chunk_size):
    chunk = content[i:i+chunk_size]
    chunk_escaped = chunk.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n')
    cmd = f'Br var f=open("autoexec.be","a") f.write("{chunk_escaped}") f.close()'
    
    try:
        r = requests.get(BASE + urllib.parse.quote(cmd), verify=False, timeout=5)
        print(f"Chunk {i//chunk_size + 1}/{(len(content)-1)//chunk_size + 1}")
        time.sleep(0.2)
    except Exception as e:
        print(f"Error: {e}")
        break

print("Upload complete - restarting...")
requests.get(BASE + "Restart%201", verify=False, timeout=5)
