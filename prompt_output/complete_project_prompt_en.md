# Prompt for the development of a Rust tool for the short put options strategy

## Goal
Develop an open-source tool in Rust (Apache 2.0) that automates the short put strategy on stocks from the NASDAQ 100, including backtesting, paper trading, risk management, logging, reporting, and Docker deployment.

---

### 1. Data Source & API

- Use [`ibkr_rust`](https://github.com/wvietor/ibkr_rust) as the API for market data, order execution, and margin calculation.
- Historical data should be cached locally to reduce API load.
- Market data updates in live operation: interval as a variable (every minute in paper trading).

---

### 2. Strategy Parameters

- Stock universe: NASDAQ 100 only.
- Minimum option premium as a variable at program start.
- All other strategy parameters (e.g., premium limits, stock list, position size) should be changeable at runtime without restart (configuration via TOML, crate: [toml](https://crates.io/crates/toml)).

---

### 3. Order Execution

- Automatic trailing order.
- Close at 50% profit (relative to premium) or 200% loss.
- Backtesting for the last 24 months, including slippage, fees, margin calculation.
- Initially paper trading only (simulation), no real orders.
- Prepare order execution for future parallel strategies.

---

### 4. Risk Management

- Maximum loss: 200% of the premium.
- Margin requirements automatically from IBKR data.
- Position size: maximum fixed amount, as a variable at the start.
- Alerts at thresholds via email (maxmeyer3372@gmail.com) and log.
- Error states: automatic notification, restart, error log via email.

---

### 5. User Interface & Reporting

- CLI application.
- Profit/loss curves as HTML web page, reports as CSV and HTML.
- All date entries in day/month/year format.

---

### 6. Persistence & Logging

- Store trades, signals, and backtests in files (CSV).
- Logging with [env_logger](https://crates.io/crates/env_logger).
- Maximum 5GB storage for backtest and trading data, automatic compression and deletion outside the Docker container.

---

### 7. Deployment & Operation

- The tool runs in a Docker container (Debian-based), max. 2 cores, 8GB RAM.
- Container should automatically restart if the program crashes.
- Automation: tool runs continuously in the container, container status is monitored.
- No automatic backups.

---

### 8. Extensibility

- Later extension to put spreads and other strategies/markets possible.
- Prepare tool for parallel execution of multiple strategies.

---

### 9. Documentation & Tests

- Inline comments for every function.
- 100% test coverage, line profiling, comprehensive function tests (open, monitor, close orders).
- Automated tests via CI/CD (Jenkins in Docker container, build creates Docker image, but no automatic publishing).

---

### 10. Interfaces & Export

- Export data/signals to third-party systems in CSV format.

---

### 11. Legal & Compliance

- All components (Docker, libraries, language) must be open source.
- Automatically generated disclaimer/risk notice in English and German.

---

### 12. Further Technical and Organizational Details

- No user management, no roles/permissions.
- Updates: tool checks for new versions itself, updates only after approval.
- No backups, no security audits, no special development workflows.
- Project is open source (Apache 2.0).
- Tool language and comments: plain English.
- No community platform or contributor guideline at the beginning.
- No explicitly excluded libraries, but all dependencies should be regularly checked for security vulnerabilities.
- No requirements for energy efficiency, but optimization potential (memory, CPU) should be checked regularly.
- No roadmap/maintenance plan, responsibility by agreement.

---

**Note:**  
Always use the latest stable versions of all tools, libraries, and dependencies.

---

**End of prompt**