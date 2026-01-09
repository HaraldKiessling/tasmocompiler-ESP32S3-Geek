# Log-Optimierung für Tasmota-77

## Problem
Das Log ist sehr voll wegen häufiger Status-Abfragen (jede Sekunde).

## Lösung

### 1. Weblog Level reduziert
```
Weblog 2
```
✅ Bereits durchgeführt - zeigt nur noch wichtige Meldungen

### 2. Status-Abfragen optimiert

**Vorher:**
- IP-Adresse: Abfrage jede Sekunde (3600x pro Stunde)
- SSID: Abfrage jede Sekunde (3600x pro Stunde)
- Uhrzeit: Abfrage jede Sekunde (notwendig für Sekunden-Anzeige)

**Nachher:**
- IP-Adresse: Abfrage alle 60 Sekunden (60x pro Stunde) ✅
- SSID: Abfrage alle 60 Sekunden (60x pro Stunde) ✅
- Uhrzeit: Abfrage jede Sekunde (notwendig)
- Initiale Abfrage: Nach 5 Sekunden beim Start

**Reduzierung:** 98% weniger Status-Abfragen für IP/SSID

## Änderungen in autoexec.be

### Neu: Counter für Netzwerk-Abfragen
```berry
class SensorDashboard : Driver
    var network_counter
    
    def init()
        self.network_counter = 0
    end
```

### Optimierte every_second()
```berry
def every_second()
    # IP/SSID nur alle 60 Sekunden
    self.network_counter += 1
    if self.network_counter >= 60
        self.network_counter = 0
        # Status 5 und Status 11 Abfragen
    end
    
    # Uhrzeit jede Sekunde
    # Sensoren jede Sekunde
end
```

### Initiale Abfrage beim Start
```berry
def update_network()
    # Einmalige Abfrage von IP und SSID
end

# Nach 5 Sekunden ausführen
tasmota.set_timer(5000, /-> global.dashboard.update_network())
```

## Upload

Datei: `autoexec_optimized.be` (9990 Bytes)

1. Öffnen Sie https://tasmota-77.samharald.eu
2. Consoles → Manage File system
3. Löschen Sie alte `autoexec.be`
4. Laden Sie `autoexec_optimized.be` als `autoexec.be` hoch
5. Restart

## Erwartetes Ergebnis

**Log-Output:**
- 98% weniger Status-Abfragen
- Nur noch wichtige Meldungen (Weblog 2)
- Übersichtliches Log

**Display:**
- Funktioniert wie bisher
- IP/SSID werden initial und alle 60 Sekunden aktualisiert
- Uhrzeit läuft weiterhin jede Sekunde
- Sensoren werden weiterhin jede Sekunde aktualisiert

**Hinweis:** IP und SSID ändern sich normalerweise nicht, daher ist eine Abfrage alle 60 Sekunden ausreichend.
