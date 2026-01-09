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

# Funktion zum Wechseln zwischen Seiten
def toggle_page()
    var current_page = haspmota.get_page_cur().id()
    if current_page == 1
        haspmota.page_show("p2")
    else
        haspmota.page_show("p1")
    end
end

# Definiert die Treiber-Klasse für zyklische Updates
class SensorDashboard : Driver
    
    def every_second()
        # 1. Liest alle Sensordaten als JSON-String
        var raw_json = tasmota.read_sensors()
        var m = json.load(raw_json)
        
        if m == nil return end
        
        # --- Netzwerkinformationen (Wifi/IP) ---
        if global.p1b2 != nil
            var raw_ip = tasmota.cmd("Status 5")
            var raw_wifi = tasmota.cmd("Status 11")
            
            var ip = parse_value(raw_ip, "IPAddress")
            var ssid = parse_value(raw_wifi, "SSId")
            
            global.p1b2.text = string.format("%s | %s", ssid, ip)
        end

        # --- BME280 Datenverarbeitung ---
        var bme_data = m.find('BME280')
        var bme_str = "BME: Nicht gefunden"
        if bme_data != nil
            var temp = bme_data.find('Temperature', 0.0)
            var press = bme_data.find('Pressure', 0.0)
            var hum = bme_data.find('Humidity', 0.0)
            bme_str = string.format("Luft: %.1fC  %.0f%%\n%.1f hPa", temp, hum, press)
        end
        
        if global.p1b10 != nil
            global.p1b10.text = bme_str
        end

        # --- DS18x20 Datenverarbeitung ---
        var ds_list_str = ""
        var keys = m.keys()
        
        for key : keys
            if string.find(key, "DS18B20") == 0
                var sensor = m[key]
                var full_id = sensor.find('Id', '000000000000')
                var temp = sensor.find('Temperature', 0.0)
                
                var len = size(full_id)
                var short_id = "????"
                if len >= 4
                    short_id = full_id[(len-4)..(len-1)]
                end
                
                ds_list_str += string.format("..%s: %.1f C\n", short_id, temp)
            end
        end
        
        if ds_list_str == "" ds_list_str = "Keine DS18x20\ngefunden" end
        
        if global.p2b20 != nil
            global.p2b20.text = ds_list_str
        end
    end
end

# Instanzieren und Registrieren
var dashboard = SensorDashboard()
tasmota.add_driver(dashboard)

# Button-Event Handling für GPIO 0 (Boot Button)
# Wechselt die Seite bei Knopfdruck
tasmota.add_rule("Button1#Action=SINGLE", toggle_page)
