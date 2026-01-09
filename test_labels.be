# Test Script für Label-Updates
import json

print("Testing labels...")

# Test 1: Prüfe ob Labels existieren
print("p1b20:", global.p1b20)
print("p1b21:", global.p1b21)

# Test 2: Setze Text direkt
if global.p1b20
    global.p1b20.text = "TEST1"
    print("Set p1b20 to TEST1")
end

if global.p1b21
    global.p1b21.text = "TEST2"
    print("Set p1b21 to TEST2")
end

# Test 3: Lese Sensoren
var m = json.load(tasmota.read_sensors())
print("Sensors:", m.keys())

# Test 4: Setze Sensor-Daten
if m.contains("DS18B20-1")
    var sensor = m["DS18B20-1"]
    var id = sensor["Id"]
    var temp = sensor["Temperature"]
    var short_id = id[(size(id)-4)..(size(id)-1)]
    var text = string.format("..%s %.1fC", short_id, temp)
    print("DS18B20-1:", text)
    
    if global.p1b20
        global.p1b20.text = text
        print("Updated p1b20")
    end
end

if m.contains("DS18B20-2")
    var sensor = m["DS18B20-2"]
    var id = sensor["Id"]
    var temp = sensor["Temperature"]
    var short_id = id[(size(id)-4)..(size(id)-1)]
    var text = string.format("..%s %.1fC", short_id, temp)
    print("DS18B20-2:", text)
    
    if global.p1b21
        global.p1b21.text = text
        print("Updated p1b21")
    end
end

print("Test complete")
