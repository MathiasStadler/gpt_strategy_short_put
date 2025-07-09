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
  - Sollen alle Aktien aus NASDAQ und S&P 500 automatisch geladen werden, oder möchtest du eine Möglichkeit, einzelne Titel auszuschließen oder eine Whitelist zu pflegen?
  - Gibt es Einschränkungen bezüglich Marktkapitalisierung, Liquidität oder Mindest-Optionsprämie?

- **Backtesting-Details:**  
  - Welche Zeitzone und Handelszeiten sollen für das Backtesting verwendet werden?
  - Sollen Dividenden, Aktiensplits oder andere Corporate Actions berücksichtigt werden?

- **Benachrichtigungen:**  
  - Welche E-Mail-Adresse(n) sollen für Warnungen verwendet werden?
  - Gibt es weitere Benachrichtigungswege (z.B. Telegram, Slack)?

- **Sicherheitsaspekte:**  
  - Wie sollen Zugangsdaten für IBKR und E-Mail sicher verwaltet werden (z.B. Umgebungsvariablen, verschlüsselte Datei)?

- **Docker/Deployment:**  
  - Gibt es spezielle Anforderungen an die Ressourcen (RAM, CPU) für den Container?
  - Soll der Container automatisch neu starten, falls das Programm abstürzt?

Bitte beantworte diese neuen Fragen, um die Planung weiter


