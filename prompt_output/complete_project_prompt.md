# Prompt für die Entwicklung eines Rust-Tools zur Short Put Optionsstrategie

## Ziel
Entwickle ein Open-Source-Tool in Rust (Apache 2.0), das die Short Put Strategie auf Aktien aus dem NASDAQ 100 automatisiert umsetzt, inklusive Backtesting, Paper Trading, Risiko-Management, Logging, Reporting und Docker-Deployment.

---

### 1. Datenquelle & API

- Nutze [`ibkr_rust`](https://github.com/wvietor/ibkr_rust) als API für Marktdaten, Orderausführung und Margin-Berechnung.
- Historische Daten sollen lokal zwischengespeichert werden, um API-Last zu reduzieren.
- Marktdatenaktualisierung im Live-Betrieb: Intervall als Variable (im Paper Trading minütlich).

---

### 2. Strategie-Parameter

- Aktienuniversum: Nur NASDAQ 100.
- Mindest-Optionsprämie als Variable am Programmanfang.
- Alle weiteren Strategieparameter (z.B. Prämiengrenzen, Aktienliste, Positionsgröße) sollen zur Laufzeit ohne Neustart änderbar sein (Konfiguration via TOML, crate: [toml](https://crates.io/crates/toml)).

---

### 3. Orderausführung

- Automatische Trailing-Order.
- Schließung bei 50% Gewinn (bezogen auf Prämie) oder 200% Verlust.
- Backtesting für die letzten 24 Monate, inkl. Slippage, Gebühren, Margin-Berechnung.
- Zuerst nur Paper Trading (Simulation), keine echten Orders.
- Orderausführung für spätere parallele Strategien vorbereiten.

---

### 4. Risiko-Management

- Maximaler Verlust: 200% der Prämie.
- Margin-Anforderungen automatisch aus IBKR-Daten.
- Positionsgröße: Maximal fester Betrag, als Variable am Anfang.
- Warnungen bei Schwellenwerten per E-Mail (maxmeyer3372@gmail.com) und Log.
- Fehlerzustände: Automatische Benachrichtigung, Neustart, Fehlerprotokoll per Mail.

---

### 5. Benutzeroberfläche & Reporting

- CLI-Anwendung.
- Gewinn/Verlust-Kurven als HTML-Webseite, Berichte als CSV und HTML.
- Alle Datumsangaben im Format Tag/Monat/Jahr.

---

### 6. Persistenz & Logging

- Speicherung von Trades, Signalen und Backtests in Dateien (CSV).
- Logging mit [env_logger](https://crates.io/crates/env_logger).
- Maximal 5GB Speicherplatz für Backtest- und Tradingdaten, automatische Komprimierung und Löschung außerhalb des Docker-Containers.

---

### 7. Deployment & Betrieb

- Das Tool läuft in einem Docker-Container (Debian-basiert), max. 2 Cores, 8GB RAM.
- Container soll automatisch neu starten, falls das Programm abstürzt.
- Automatisierung: Tool läuft dauerhaft im Container, Container-Status wird überwacht.
- Keine automatische Backups.

---

### 8. Erweiterbarkeit

- Spätere Erweiterung um Put Spreads und weitere Strategien/Märkte möglich.
- Tool für parallele Ausführung mehrerer Strategien vorbereiten.

---

### 9. Dokumentation & Tests

- Inline-Kommentare für jede Funktion.
- 100% Testabdeckung, Line-Profiling, umfassende Funktionstests (Order öffnen, kontrollieren, schließen).
- Automatische Tests via CI/CD (Jenkins in Docker-Container, Build erzeugt Docker-Image, aber kein automatisches Veröffentlichen).

---

### 10. Schnittstellen & Export

- Export von Daten/Signalen an Drittsysteme im CSV-Format.

---

### 11. Rechtliches & Compliance

- Alle Bestandteile (Docker, Libraries, Sprache) müssen Open Source sein.
- Automatisch generierter Disclaimer/Risikohinweis in Englisch und Deutsch.

---

### 12. Weitere technische und organisatorische Details

- Keine Benutzerverwaltung, keine Rollen/Rechte.
- Updates: Tool prüft selbst auf neue Versionen, Updates nur nach Zustimmung.
- Keine Backups, keine Security-Audits, keine speziellen Entwicklungs-Workflows.
- Projekt ist Open Source (Apache 2.0).
- Tool-Sprache und Kommentare: Plain English.
- Keine Community-Plattform oder Contributor-Richtlinie zu Beginn.
- Keine explizit ausgeschlossenen Bibliotheken, aber alle Abhängigkeiten sollen regelmäßig auf Sicherheitslücken geprüft werden.
- Keine Anforderungen an Energieeffizienz, aber Optimierungspotenziale (Speicher, CPU) sollen regelmäßig geprüft werden.
- Keine Roadmap/Wartungsplan, Verantwortlichkeit nach Absprache.

---

**Bitte beachte:**  
Verwende stets die letzten stabilen Versionen aller Tools, Libraries und Abhängigkeiten.

---

**Ende des