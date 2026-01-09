import haspmota
import json
import string
haspmota.start()
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
class SensorDashboard : Driver
    def every_second()
        var raw_json = tasmota.read_sensors()
        if raw_json == nil return end
        var m = json.load(raw_json)
        if m == nil return end
        if global.p1b12 != nil
            var raw_ip = tasmota.cmd("Status 5")
            var ip = parse_value(raw_ip, "IPAddress")
            global.p1b12.text = ip
        end
        if global.p1b13 != nil
            var raw_wifi = tasmota.cmd("Status 11")
            var ssid = parse_value(raw_wifi, "SSId")
            global.p1b13.text = ssid
        end
        var bme_count = 0
        var bme_labels = [global.p1b30, global.p1b31, global.p1b32]
        if m.contains('BME280') && bme_count < 3
            var sensor = m['BME280']
            var temp = sensor.find('Temperature', 0.0)
            var hum = sensor.find('Humidity', 0.0)
            if bme_labels[bme_count] != nil
                bme_labels[bme_count].text = string.format("BME280 %.1f°C %.0f%%", temp, hum)
                bme_count += 1
            end
        end
        if m.contains('BME280-1') && bme_count < 3
            var sensor = m['BME280-1']
            var temp = sensor.find('Temperature', 0.0)
            var hum = sensor.find('Humidity', 0.0)
            if bme_labels[bme_count] != nil
                bme_labels[bme_count].text = string.format("BME280-1 %.1f°C %.0f%%", temp, hum)
                bme_count += 1
            end
        end
        if m.contains('BME280-2') && bme_count < 3
            var sensor = m['BME280-2']
            var temp = sensor.find('Temperature', 0.0)
            var hum = sensor.find('Humidity', 0.0)
            if bme_labels[bme_count] != nil
                bme_labels[bme_count].text = string.format("BME280-2 %.1f°C %.0f%%", temp, hum)
                bme_count += 1
            end
        end
        if m.contains('BME280-3') && bme_count < 3
            var sensor = m['BME280-3']
            var temp = sensor.find('Temperature', 0.0)
            var hum = sensor.find('Humidity', 0.0)
            if bme_labels[bme_count] != nil
                bme_labels[bme_count].text = string.format("BME280-3 %.1f°C %.0f%%", temp, hum)
                bme_count += 1
            end
        end
        while bme_count < 3
            if bme_labels[bme_count] != nil
                bme_labels[bme_count].text = ""
            end
            bme_count += 1
        end
        var ds_labels = [global.p1b20, global.p1b21, global.p1b22, global.p1b23, global.p1b24, global.p1b25, global.p1b26, global.p1b27, global.p1b28, global.p1b29]
        var ds_count = 0
        for i:1..10
            var key = string.format('DS18B20-%d', i)
            if m.contains(key) && ds_count < 10
                var sensor = m[key]
                var id = sensor['Id']
                var temp = sensor['Temperature']
                var short_id = id[8..11]
                if ds_labels[ds_count] != nil
                    ds_labels[ds_count].text = string.format("..%s %.1f°C", short_id, temp)
                end
                ds_count += 1
            end
        end
        while ds_count < 10
            if ds_labels[ds_count] != nil
                ds_labels[ds_count].text = ""
            end
            ds_count += 1
        end
    end
end
global.dashboard = SensorDashboard()
tasmota.add_driver(global.dashboard)
tasmota.add_cron("*/1 * * * * *", /-> global.dashboard.every_second(), "sensor_update")
