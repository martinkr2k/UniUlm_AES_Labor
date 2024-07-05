# Übung 10

## Aufgabe 1

### Vergleich des Chipflächenverbrauchs

Bereich | Software | Hardware
------- | -------- | --------
Logic utilization (in ALMs) | 835 / 41910 (2%) | 1081 / 41910 (3%)
Total Registers | 972 | 1044
Total Block memory bits | 2.059.264 / 5.662.720 (36%) | 2.131.264 / 5.662.720 (38%)

### Vergleich der Laufzeit

Section | Time(sec) | Time (ms) | Time (clocks)
-------- | -------- | -------- | -----
 Software | 0.0009 | 0.9 | 4468
 Hardware | 0 | 0 | 87

 ## Aufgabe 2

 1. Entwicklungskosten
    - Software besser, da Hardware mit Design und Verifikation umständlicher ist.
 2. Energieverbrauch
    - Hardware geringer, da bei Software CPU durchgehend aktiv ist und längere Berechnungszeit braucht
 3. Flexibilität und Anpassbarkeit
    - Software einfacher zu debuggen
    - Änderungen können mit einfachen Softwareupdates ausgeführt werden. 

 ### Software-Implementierung:

Vorteile: Flexibilität, kürzere Entwicklungszeit, geringere Kosten.
Nachteile: Höherer Energieverbrauch, längere Laufzeiten, höhere CPU-Belastung.

### Hardware-Implementierung:

Vorteile: Niedriger Energieverbrauch, kürzere Laufzeiten, entlastet die CPU.
Nachteile: Weniger flexibel, längere Entwicklungszeit, höhere Kosten.