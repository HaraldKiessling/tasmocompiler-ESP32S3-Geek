#!/usr/bin/env python3
import requests
import time
import urllib.parse

BASE = "https://tasmota-77.samharald.eu/cm?cmnd="

# Lese Datei
with open('autoexec_inline.be', 'r') as f:
    content = f.read()

# Lösche alte Datei
cmd = "Br import path path.remove('autoexec.be')"
requests.get(BASE + urllib.parse.quote(cmd), verify=False)
time.sleep(0.5)

# Erstelle neue Datei
cmd = "Br var f=open('autoexec.be','w') f.close()"
requests.get(BASE + urllib.parse.quote(cmd), verify=False)
time.sleep(0.5)

# Schreibe in Chunks von 200 Zeichen
chunk_size = 200
for i in range(0, len(content), chunk_size):
    chunk = content[i:i+chunk_size]
    # Escape für URL
    chunk_escaped = chunk.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n')
    cmd = f'Br var f=open("autoexec.be","a") f.write("{chunk_escaped}") f.close()'
    
    try:
        r = requests.get(BASE + urllib.parse.quote(cmd), verify=False, timeout=5)
        print(f"Chunk {i//chunk_size + 1}: {len(chunk)} bytes")
        time.sleep(0.3)
    except Exception as e:
        print(f"Error at chunk {i}: {e}")
        break

print("Upload complete")
