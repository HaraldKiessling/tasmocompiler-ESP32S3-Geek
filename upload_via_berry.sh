#!/bin/bash
BASE="https://tasmota-77.samharald.eu/cm?cmnd="

# Komprimiere autoexec_inline.be noch weiter - entferne alle Leerzeichen
python3 << 'PYTHON'
with open('autoexec_inline.be', 'r') as f:
    content = f.read()

# Minimiere: Entferne überflüssige Leerzeichen (aber nicht in Strings)
lines = []
for line in content.split('\n'):
    line = line.strip()
    if line and not line.startswith('#'):
        lines.append(line)

with open('autoexec_ultra_compact.be', 'w') as f:
    f.write('\n'.join(lines))

print(f"Created autoexec_ultra_compact.be")
PYTHON

wc -c autoexec_ultra_compact.be
