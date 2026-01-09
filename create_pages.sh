#!/bin/bash
BASE="https://tasmota-77.samharald.eu/cm?cmnd="

# Lösche alte Datei
curl -k -s "${BASE}Br%20import%20path%20path.remove('pages.jsonl')" 2>/dev/null

# Erstelle neue pages.jsonl via Berry
curl -k -s "${BASE}Br%20var%20f=open('pages.jsonl','w')%20f.write('{\"page\":1}\\n')%20f.close()" 2>/dev/null
sleep 1

# Füge Zeilen hinzu
LINES=(
'{"id":0,"bg_color":"#0000A0","bg_grad_color":"#000000","bg_grad_dir":1}'
'{"id":10,"obj":"obj","x":0,"y":0,"w":240,"h":26,"bg_color":"#D00000","bg_opa":255,"radius":0,"border_width":0}'
'{"id":12,"obj":"label","x":3,"y":4,"w":75,"h":18,"text":"192.168.0.77","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":13,"obj":"label","x":82,"y":4,"w":60,"h":18,"text":"miVida2","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":14,"obj":"lv_clock","x":145,"y":4,"w":65,"h":18,"text_color":"#FFFFFF","text_font":"montserrat-14","format":"%H:%M:%S"}'
'{"id":15,"obj":"lv_wifi_arcs","x":215,"y":0,"w":25,"h":26,"bg_color":"#D00000","line_color":"#FFFFFF"}'
'{"id":30,"obj":"label","x":5,"y":29,"w":230,"h":14,"text":"","text_color":"#FFFF00","text_font":"montserrat-14","align":0}'
'{"id":31,"obj":"label","x":5,"y":44,"w":230,"h":14,"text":"","text_color":"#FFFF00","text_font":"montserrat-14","align":0}'
'{"id":32,"obj":"label","x":5,"y":59,"w":230,"h":14,"text":"","text_color":"#FFFF00","text_font":"montserrat-14","align":0}'
'{"id":20,"obj":"label","x":5,"y":76,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":21,"obj":"label","x":125,"y":76,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":22,"obj":"label","x":5,"y":91,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":23,"obj":"label","x":125,"y":91,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":24,"obj":"label","x":5,"y":106,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":25,"obj":"label","x":125,"y":106,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":26,"obj":"label","x":5,"y":121,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":27,"obj":"label","x":125,"y":121,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":28,"obj":"label","x":5,"y":136,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
'{"id":29,"obj":"label","x":125,"y":136,"w":110,"h":14,"text":"","text_color":"#FFFFFF","text_font":"montserrat-14","align":0}'
)

for line in "${LINES[@]}"; do
    ESCAPED=$(echo "$line" | sed 's/"/\\"/g')
    CMD="Br%20var%20f=open('pages.jsonl','a')%20f.write('${ESCAPED}\\n')%20f.close()"
    curl -k -s "${BASE}${CMD}" 2>/dev/null
    sleep 0.5
done

echo "pages.jsonl created"
