### 3. Orderausführung

- **Ordertyp:** Automatische Trailing-Order.
- **Schließung:**
  - Bei 50% Gewinn (bezogen auf die erhaltene Prämie).
  - Bei 200% Verlust (bezogen auf die erwartete Prämie).
- **Backtesting:** Für die letzten 24 Monate.
- **Paper Trading:** Zuerst nur Simulation, keine echten Orders.
  - **Frage:** Gibt es spezielle Anforderungen an die Backtesting-Logik (z.B. Slippage, Gebühren, Margin-Berechnung)? Ja berücksichtige alle diese Punkte

### 4. Risiko-Management

- **Maximaler Verlust:** 200% der Prämie.
- **Margin-Anforderungen:** Sollen diese automatisch aus den IBKR-Daten übernommen werden? Ja 
- **Positionsgröße:** Wie soll diese bestimmt werden? (z.B. fester Betrag, prozentual vom Portfolio) Max fester Betrag als Variable am Anfang des prg 
- **Warnungen:** Sollen Benachrichtigungen (z.B. per E-Mail oder Log) bei Schwellenwerten erfolgen? Ja bitte

### 5. Benutzeroberfläche
- **CLI, Web oder GUI:** Welche bevorzugst du? Ich bevorzugge cli
- **Berichte/Visualisierung:** Sollen z.B. Gewinn/Verlust-Kurven als Diagramm ausgegeben werden? ja im web format/ als Web page
  - **Frage:** Welche Formate (z.B. CSV, PDF, HTML) sind für dich relevant? ja sind sie benutze nur csv, html

### 6. Persistenz & Logging

- **Speicherung:** Sollen Trades, Signale und Backtests in einer Datei (z.B. CSV/JSON) oder einer Datenbank gespeichert werden? Ja , in  einer Datei
- **Logging:** Welche Informationen sind für dich wichtig? (z.B. alle Orderdetails, Fehler, Performance-Kennzahlen) Ja ist mir mich wichtig bitte verwnde dafpr das rust crates https://crates.io/crates/env_logger

### 7. Deployment & Betrieb
- **Lokal oder Server:** Wo soll das Tool laufen? Das Tool soll in einem Docker container baisert auf debain laufen
- 
- **Automatisierung:** Soll das Tool regelmäßig (z.B. täglich) automatisch laufen? Ja es soll ständig in einem Docker container, bitte erstelle dafür ein Image  laufen, bitte überprüfe ob das Tool bzw der Docker container läuft

### 8. Erweiterbarkeit
- **Weitere Strategien/Märkte:** Planst du, später weitere Strategien (z.B. Covered Call) oder Märkte (z.B. Europa) zu integrieren? Ja , put spreads als begrenzung des Kapitalaufwnd und des Risikos

### 9. Weitere Details & Präzisierungen

- **Datenuniversum:**  
  - Sollen alle Aktien aus NASDAQ und S&P 500 automatisch geladen werden, oder möchtest du eine Möglichkeit, einzelne Titel auszuschließen oder eine Whitelist zu pflegen? Verwende NUR den NASDAQ 100
  - Gibt es Einschränkungen bezüglich Marktkapitalisierung, Liquidität oder Mindest-Optionsprämie? Die Mindest-Optionsprämie soll als Varibel am Anfang des Programm angebar sein.

- **Backtesting-Details:**  
  - Welche Zeitzone und Handelszeiten sollen für das Backtesting verwendet werden? Die Handelszeiten der Börsen
  - Sollen Dividenden, Aktiensplits oder andere Corporate Actions berücksichtigt werden? Nein

- **Benachrichtigungen:**  
  - Welche E-Mail-Adresse(n) sollen für Warnungen verwendet werden? Bitte verwende maxmeyer3372@gmail.com
  - Gibt es weitere Benachrichtigungswege (z.B. Telegram, Slack)? Nein erstmal bitte nicht

- **Sicherheitsaspekte:**  
  - Wie sollen Zugangsdaten für IBKR und E-Mail sicher verwaltet werden (z.B. Umgebungsvariablen, verschlüsselte Datei)? Nein nicht notwendig.

- **Docker/Deployment:**  
  - Gibt es spezielle Anforderungen an die Ressourcen (RAM, CPU) für den Container? Maxmal 2 core und 8GB Ram
  - Soll der Container automatisch neu starten, falls das Programm abstürzt? Ja , bitte

Bitte beantworte diese neuen Fragen, um die Planung weiter zu präzisieren.

---

### 10. Weitere offene Punkte & Präzisierungen

- **Fehlerbehandlung & Monitoring:**  
  - Wie sollen Fehler und Ausfälle im laufenden Betrieb behandelt werden? (z.B. automatische Benachrichtigung, Neustart, Fehlerprotokoll)
  - sende für diese Fehlerzustände eine Mail mit dem Ergebnis bei einem automatisch restart automatische Benachrichtigung,  Neustart, Fehlerprotokoll
  - Soll ein externes Monitoring-Tool (z.B. Prometheus, Grafana) integriert werden? Nein , jetzt noch nicht

- **API-Limits & Rate-Limiting:**  
  - Gibt es Vorgaben oder Wünsche zum Umgang mit API-Limits der IBKR-Schnittstelle? Nein
  - Soll das Tool automatisch pausieren oder retries durchführen, wenn Limits erreicht werden? Ja, bitte

- **Performance & Skalierung:**  
  - Gibt es Anforderungen an die Geschwindigkeit der Orderausführung oder des Backtestings? Nein
  - Soll das Tool für spätere parallele Ausführung (z.B. mehrere Strategien gleichzeitig) vorbereitet werden? Ja . bitte.

- **Dokumentation & Support:**  
  - Welche Art von Dokumentation wünschst du dir? (z.B. README, Inline-Kommentare, User Guide) Inline-Kommentare jder funktion
  - Soll es eine Möglichkeit geben, Support-Anfragen oder Feedback direkt aus dem Tool zu senden? Nein

- **Teststrategie:**  
  - Welche Arten von Tests sind dir wichtig? (z.B. Unit-Tests, Integrationstests, End-to-End-Tests) 100 % Testabdeckung, line profiling und umfassende Funktionztest zum öffnen, kontrollieren und schliessen einer Order
  - Soll das Tool automatisch getestet werden (z.B. via CI/CD Pipeline)? Ja bitte

Bitte beantworte diese neuen Fragen, damit das Konzept weiter konkretisiert werden

---

### 11. Weitere technische und organisatorische Details

- **Datenaktualisierung:**  
  - Wie oft sollen die Marktdaten im Live-Betrieb aktualisiert werden (z.B. minütlich, sekündlich, bei jedem neuen Tick)?
  - Sollen historische Daten lokal zwischengespeichert werden, um API-Last zu reduzieren?

- **Konfigurierbarkeit:**  
  - Welche Einstellungen sollen zur Laufzeit ohne Neustart änderbar sein (z.B. Prämiengrenzen, Aktienliste, Positionsgröße)?
  - Wünschst du dir eine Konfigurationsdatei (z.B. YAML, TOML, JSON) oder ausschließlich Umgebungsvariablen?

- **Benutzerverwaltung (für spätere Erweiterungen):**  
  - Soll das Tool später mehrere Benutzer mit eigenen Einstellungen unterstützen?
  - Gibt es Anforderungen an Rollen oder Rechteverwaltung?

- **Wartung & Updates:**  
  - Wie sollen Updates des Tools und der Abhängigkeiten gehandhabt werden (z.B. automatisiert, manuell)?
  - Soll das Tool sich selbst auf neue Versionen prüfen können?

- **Archivierung & Datenhaltung:**  
  - Wie lange sollen Backtest- und Tradingdaten aufbewahrt werden?
  - Sollen alte Daten automatisch archiviert oder gelöscht werden?

Bitte beantworte diese neuen Fragen, um die Planung weiter zu


