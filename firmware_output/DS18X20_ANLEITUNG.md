# DS18X20 Temperatursensoren - Anleitung

Diese Firmware unterstützt bis zu **10 DS18X20 Temperatursensoren** (erhöht von Standard 8).

## Unterstützte Sensoren

- **DS18B20** - ±0.5°C Genauigkeit, 12-bit
- **DS18S20** - ±0.5°C Genauigkeit, 9-bit
- **DS1822** - ±2°C Genauigkeit, 12-bit
- **MAX31850** - ±0.25°C Genauigkeit, 14-bit (Thermoelement)

## Hardware-Aufbau

### Einfacher Aufbau (1 Sensor)

```
ESP32 S3          DS18B20
--------          -------
GPIO (z.B. 4) ----+---- Data (gelb)
3.3V -------------+---- VDD (rot)
GND --------------+---- GND (schwarz)
                  |
                 4.7kΩ Pullup-Widerstand
                 (zwischen Data und VDD)
```

### Mehrere Sensoren (Bus-Topologie)

```
ESP32 S3
--------
GPIO 4 ----+---- DS18B20 #1 (Data)
           |
           +---- DS18B20 #2 (Data)
           |
           +---- DS18B20 #3 (Data)
           |
           ... bis zu 10 Sensoren
           |
          4.7kΩ
           |
3.3V ------+---- Alle VDD zusammen
GND -------+---- Alle GND zusammen
```

**Wichtig:**
- Nur **ein** Pullup-Widerstand für alle Sensoren
- Alle Sensoren parallel am gleichen GPIO
- Kurze Kabel verwenden (< 10m pro Sensor)
- Bei langen Kabeln: 2.2kΩ statt 4.7kΩ

## Tasmota Konfiguration

### 1. GPIO konfigurieren

**Via Web-Interface:**
1. Configuration → Configure Module
2. GPIO auswählen (z.B. GPIO4)
3. Funktion: **DS18x20**
4. Save

**Via Console:**
```
GPIO4 DS18x20
```

### 2. Sensoren erkennen

Nach Neustart werden alle Sensoren automatisch erkannt:

**Console:**
```
Status 10
```

Ausgabe zeigt alle gefundenen Sensoren mit IDs.

### 3. Sensoren benennen

**Automatische Namen:**
Sensoren werden automatisch benannt: DS18B20-1, DS18B20-2, etc.

**Eigene Namen vergeben:**
```
DS18Alias1 Wohnzimmer
DS18Alias2 Schlafzimmer
DS18Alias3 Küche
DS18Alias4 Bad
DS18Alias5 Keller
DS18Alias6 Garage
DS18Alias7 Außen
DS18Alias8 Heizung
DS18Alias9 Warmwasser
DS18Alias10 Solar
```

### 4. Temperatur auslesen

**Web-Interface:**
Temperaturen werden automatisch auf der Hauptseite angezeigt.

**Console:**
```
Status 10
```

**MQTT:**
```
tele/tasmota_XXXXXX/SENSOR
{
  "Time": "2026-01-09T11:00:00",
  "DS18B20-1": {"Id": "00000123ABCD", "Temperature": 21.5},
  "DS18B20-2": {"Id": "00000456EFGH", "Temperature": 22.3},
  ...
}
```

## Erweiterte Konfiguration

### Auflösung ändern

Standard: 12-bit (0.0625°C Auflösung)

```
DS18Resolution 9   # 9-bit:  0.5°C    (93.75ms)
DS18Resolution 10  # 10-bit: 0.25°C   (187.5ms)
DS18Resolution 11  # 11-bit: 0.125°C  (375ms)
DS18Resolution 12  # 12-bit: 0.0625°C (750ms)
```

### Interner Pullup verwenden

Wenn kein externer Pullup-Widerstand vorhanden:

```
SetOption74 1
```

**Achtung:** Funktioniert nur mit einem Sensor und kurzen Kabeln!

## Troubleshooting

### Keine Sensoren gefunden

**Prüfen:**
1. ✅ Verkabelung korrekt?
2. ✅ Pullup-Widerstand vorhanden? (4.7kΩ)
3. ✅ GPIO richtig konfiguriert?
4. ✅ Sensoren mit Strom versorgt?

**Console-Befehle:**
```
Status 10          # Zeigt alle Sensoren
GPIO               # Zeigt GPIO-Konfiguration
```

### Sensoren zeigen falsche Werte

**Lösungen:**
1. Kabel kürzer machen
2. Kleineren Pullup verwenden (2.2kΩ)
3. Parasitäre Stromversorgung vermeiden (VDD anschließen)
4. Sensoren einzeln testen

### Nur einige Sensoren werden erkannt

**Mögliche Ursachen:**
1. Kabel zu lang
2. Pullup-Widerstand zu groß
3. Defekte Sensoren
4. Schlechte Lötstellen

**Test:**
Sensoren einzeln anschließen und testen.

## Berry Script Beispiel

```berry
import json

# Temperaturen auslesen
var sensors = tasmota.read_sensors()
var temps = []

# Alle DS18x20 Sensoren durchgehen
for key: sensors.keys()
  if string.find(key, "DS18") == 0
    temps.push(sensors[key]["Temperature"])
  end
end

# Durchschnittstemperatur berechnen
var avg = 0
for temp: temps
  avg += temp
end
avg = avg / size(temps)

print("Durchschnittstemperatur:", avg, "°C")
```

## LVGL Display Beispiel

```berry
import lvgl as lv

# Font laden (nach Upload)
var font = lv.freetype_font("Roboto-Bold.ttf", 24)

# Label für Temperatur
var temp_label = lv.label(lv.scr_act())
temp_label.set_style_text_font(font, lv.PART_MAIN | lv.STATE_DEFAULT)
temp_label.align(lv.ALIGN_CENTER, 0, 0)

# Temperatur aktualisieren (alle 10 Sekunden)
def update_temp()
  var sensors = tasmota.read_sensors()
  if sensors.contains("DS18B20-1")
    var temp = sensors["DS18B20-1"]["Temperature"]
    temp_label.set_text(string.format("%.1f °C", temp))
  end
end

tasmota.add_cron("*/10 * * * * *", update_temp, "update_temp")
update_temp()  # Sofort ausführen
```

## Weitere Informationen

- **Tasmota DS18x20 Dokumentation**: https://tasmota.github.io/docs/DS18x20/
- **OneWire Protokoll**: https://www.maximintegrated.com/en/products/ibutton-one-wire/one-wire.html
- **DS18B20 Datenblatt**: https://datasheets.maximintegrated.com/en/ds/DS18B20.pdf

## Technische Details

- **OneWire Bus**: 1-Wire Protokoll
- **Adressierung**: 64-bit ROM Code (eindeutig pro Sensor)
- **Stromversorgung**: 3.0V - 5.5V
- **Temperaturbereich**: -55°C bis +125°C
- **Genauigkeit**: ±0.5°C (-10°C bis +85°C)
- **Konversionszeit**: 750ms (12-bit)
- **Max. Sensoren**: 10 (in dieser Firmware)
