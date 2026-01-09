import haspmota
import json
import string

# Startet die HASPmota Engine
haspmota.start()

# Parsing Helfer für Netzwerk-Informationen
def parse_value(raw_text, key)
    var s = string.format("%s", raw_text)
    var key_idx = string.find(s, key)
    if key_idx == -1 return "Wait..." end
    
    var col_idx = string.find(s, ":", key_idx)
    if col_idx == -1 return "?" end
    
    var start_quote = -1
    var quote_char = ""
    var i = col_idx + 1
    var max = size(s)
    
    while i < max
        var c = s[i]
        if c == '"' || c == "'"
            start_quote = i
            quote_char = c
            break
        end
        i += 1
    end
    
    if start_quote == -1 return "?" end
    var end_quote = string.find(s, quote_char, start_quote + 1)
    if end_quote == -1 return "?" end
    
    var result = ""
    for j : start_quote + 1 .. end_quote - 1
        result += s[j]
    end
    return result
end

# Definiert die Treiber-Klasse für zyklische Updates
class SensorDashboard : Driver
    
    def every_second()
        # Liest alle Sensordaten als JSON-String und parsed sie
        var raw_json = tasmota.read_sensors()
        if raw_json == nil return end
        
        var m = json.load(raw_json)
        if m == nil return end
        
        # --- Header: IP-Adresse (p0b12) ---
        if global.p0b12 != nil
            var raw_ip = tasmota.cmd("Status 5")
            var ip = parse_value(raw_ip, "IPAddress")
            global.p0b12.text = ip
        end
        
        # --- Header: SSID (p0b13) ---
        if global.p0b13 != nil
            var raw_wifi = tasmota.cmd("Status 11")
            var ssid = parse_value(raw_wifi, "SSId")
            global.p0b13.text = ssid
        end
        
        # --- BME280 Sensoren (p0b30-p0b32) ---
        # Suche nach BME280, BME680, BMP280, etc.
        var bme_sensors = []
        var keys = m.keys()
        
        for key : keys
            if string.find(key, "BME") == 0 || string.find(key, "BMP") == 0
                bme_sensors.push(key)
            end
        end
        
        # BME Sensoren anzeigen (max 3)
        var bme_labels = [global.p0b30, global.p0b31, global.p0b32]
        
        for i : 0 .. 2
            if bme_labels[i] != nil
                if i < size(bme_sensors)
                    var sensor_key = bme_sensors[i]
                    var sensor = m[sensor_key]
                    
                    # ID extrahieren (falls vorhanden)
                    var sensor_id = sensor.find('Id', '')
                    var short_id = "????"
                    if size(sensor_id) >= 4
                        var len = size(sensor_id)
                        short_id = sensor_id[(len-4)..(len-1)]
                    end
                    
                    var temp = sensor.find('Temperature', 0.0)
                    var hum = sensor.find('Humidity', 0.0)
                    
                    # Format: ..ABCD 22.5°C 45%
                    if hum > 0
                        bme_labels[i].text = string.format("..%s %.1f°C %.0f%%", short_id, temp, hum)
                    else
                        bme_labels[i].text = string.format("..%s %.1f°C", short_id, temp)
                    end
                else
                    bme_labels[i].text = ""
                end
            end
        end
        
        # --- DS18x20 Sensoren zweispaltig (p0b20-p0b27) ---
        var ds_sensors = []
        
        for key : keys
            if string.find(key, "DS18B20") == 0 || string.find(key, "DS18S20") == 0 || string.find(key, "DS1822") == 0
                var sensor = m[key]
                var full_id = sensor.find('Id', '000000000000')
                var temp = sensor.find('Temperature', 0.0)
                
                # ID Kürzung: Letzte 4 Zeichen
                var len = size(full_id)
                var short_id = "????"
                if len >= 4
                    short_id = full_id[(len-4)..(len-1)]
                end
                
                ds_sensors.push({
                    'id': short_id,
                    'temp': temp
                })
            end
        end
        
        # DS18x20 Sensoren anzeigen (max 8, zweispaltig = 4 Zeilen)
        var ds_labels = [
            global.p0b20, global.p0b21,  # Zeile 1
            global.p0b22, global.p0b23,  # Zeile 2
            global.p0b24, global.p0b25,  # Zeile 3
            global.p0b26, global.p0b27   # Zeile 4
        ]
        
        for i : 0 .. 7
            if ds_labels[i] != nil
                if i < size(ds_sensors)
                    var sensor = ds_sensors[i]
                    # Format: ..ABCD 22.5°C
                    ds_labels[i].text = string.format("..%s %.1f°C", sensor['id'], sensor['temp'])
                else
                    ds_labels[i].text = ""
                end
            end
        end
    end
end

# Instanzieren und Registrieren
var dashboard = SensorDashboard()
tasmota.add_driver(dashboard)
