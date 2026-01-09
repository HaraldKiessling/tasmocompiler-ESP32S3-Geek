#!/usr/bin/env python3
import requests
import time
import urllib.parse
import warnings
warnings.filterwarnings('ignore')

BASE = "https://tasmota-77.samharald.eu/cm?cmnd="

print("Uploading optimized autoexec.be...")
with open('autoexec_optimized.be', 'r') as f:
    content = f.read()

cmd = "Br var f=open('autoexec.be','w') f.close()"
requests.get(BASE + urllib.parse.quote(cmd), verify=False, timeout=5)
time.sleep(0.5)

chunk_size = 150
total_chunks = (len(content)-1)//chunk_size + 1
for i in range(0, len(content), chunk_size):
    chunk = content[i:i+chunk_size]
    chunk_escaped = chunk.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n')
    cmd = f'Br var f=open("autoexec.be","a") f.write("{chunk_escaped}") f.close()'
    
    try:
        requests.get(BASE + urllib.parse.quote(cmd), verify=False, timeout=5)
        if (i//chunk_size + 1) % 10 == 0 or (i//chunk_size + 1) == total_chunks:
            print(f"  Progress: {i//chunk_size + 1}/{total_chunks} chunks")
        time.sleep(0.2)
    except Exception as e:
        print(f"  Error at chunk {i//chunk_size + 1}: {e}")
        break

print("Upload complete!")
print("\nRestarting device...")
requests.get(BASE + "Restart%201", verify=False, timeout=5)
