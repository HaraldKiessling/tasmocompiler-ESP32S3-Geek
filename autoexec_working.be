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
        
        # --- Header: IP-Adresse (p1b12) ---
        if global.p1b12 != nil
            var raw_ip = tasmota.cmd("Status 5")
            var ip = parse_value(raw_ip, "IPAddress")
            global.p1b12.text = ip
        end
        
        # --- Header: SSID (p1b13) ---
        if global.p1b13 != nil
            var raw_wifi = tasmota.cmd("Status 11")
            var ssid = parse_value(raw_wifi, "SSId")
            global.p1b13.text = ssid
        end
        
        # --- BME280 Sensoren (p1b30-p1b32) ---
        var bme_count = 0
        var bme_labels = [global.p1b30, global.p1b31, global.p1b32]
        
        # Prüfe BME280
        if m.contains('BME280')
            var sensor = m['BME280']
            var temp = sensor.find('Temperature', 0.0)
            var hum = sensor.find('Humidity', 0.0)
            if bme_labels[bme_count] != nil
                bme_labels[bme_count].text = string.format("BME280 %.1f°C %.0f%%", temp, hum)
                bme_count += 1
            end
        end
        
        # Leere restliche BME Labels
        while bme_count < 3
            if bme_labels[bme_count] != nil
                bme_labels[bme_count].text = ""
            end
            bme_count += 1
        end
        
        # --- DS18x20 Sensoren (p1b20-p1b27) ---
        var ds_labels = [
            global.p1b20, global.p1b21,
            global.p1b22, global.p1b23,
            global.p1b24, global.p1b25,
            global.p1b26, global.p1b27
        ]
        
        var ds_count = 0
        
        # DS18B20-1
        if m.contains('DS18B20-1') && ds_count < 8
            var sensor = m['DS18B20-1']
            var id = sensor['Id']
            var temp = sensor['Temperature']
            var short_id = id[8..11]
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
            end
            ds_count += 1
        end
        
        # DS18B20-2
        if m.contains('DS18B20-2') && ds_count < 8
            var sensor = m['DS18B20-2']
            var id = sensor['Id']
            var temp = sensor['Temperature']
            var short_id = id[8..11]
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
            end
            ds_count += 1
        end
        
        # DS18B20-3
        if m.contains('DS18B20-3') && ds_count < 8
            var sensor = m['DS18B20-3']
            var id = sensor['Id']
            var temp = sensor['Temperature']
            var short_id = id[8..11]
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
            end
            ds_count += 1
        end
        
        # DS18B20-4
        if m.contains('DS18B20-4') && ds_count < 8
            var sensor = m['DS18B20-4']
            var id = sensor['Id']
            var temp = sensor['Temperature']
            var short_id = id[8..11]
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
            end
            ds_count += 1
        end
        
        # DS18B20-5
        if m.contains('DS18B20-5') && ds_count < 8
            var sensor = m['DS18B20-5']
            var id = sensor['Id']
            var temp = sensor['Temperature']
            var short_id = id[8..11]
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
            end
            ds_count += 1
        end
        
        # DS18B20-6
        if m.contains('DS18B20-6') && ds_count < 8
            var sensor = m['DS18B20-6']
            var id = sensor['Id']
            var temp = sensor['Temperature']
            var short_id = id[8..11]
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
            end
            ds_count += 1
        end
        
        # DS18B20-7
        if m.contains('DS18B20-7') && ds_count < 8
            var sensor = m['DS18B20-7']
            var id = sensor['Id']
            var temp = sensor['Temperature']
            var short_id = id[8..11]
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
            end
            ds_count += 1
        end
        
        # DS18B20-8
        if m.contains('DS18B20-8') && ds_count < 8
            var sensor = m['DS18B20-8']
            var id = sensor['Id']
            var temp = sensor['Temperature']
            var short_id = id[8..11]
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
            end
            ds_count += 1
        end
        
        # Leere restliche DS Labels
        while ds_count < 8
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = ""
            end
            ds_count += 1
        end
    end
end

# Globale Instanz des Dashboards
global.dashboard = SensorDashboard()

# Registriere den Driver
tasmota.add_driver(global.dashboard)

# Zusätzlich: Cron-Job als Backup (läuft jede Sekunde)
tasmota.add_cron("*/1 * * * * *", /-> global.dashboard.every_second(), "sensor_update")
