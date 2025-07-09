#!/bin/bash
# filepath: /home/trapapa/gpt_strategy_short_put/setup_project.sh

# Exit on error
set -e

# 1. Projektverzeichnis und Initialisierung
PROJECT_NAME="short_put_strategy"
echo "==> Initialisiere Rust-Projekt: $PROJECT_NAME"
cargo new $PROJECT_NAME --bin
cd $PROJECT_NAME

# 2. Notwendige Crates hinzufügen
echo "==> Füge notwendige Crates hinzu"
cat >> Cargo.toml <<EOL

[dependencies]
ibkr-rust = "0.7"           # Beispiel, prüfe ggf. aktuelle Version
serde = { version = "1.0", features = ["derive"] }
serde_json = "1.0"
toml = "0.7"
chrono = "0.4"
reqwest = { version = "0.11", features = ["blocking", "json"] }
scraper = "0.18"
env_logger = "0.11"
log = "0.4"
csv = "1.3"
EOL

# 3. Dockerfile erstellen
echo "==> Erstelle Dockerfile"
cat > Dockerfile <<EOL
FROM rust:1.77-slim-buster

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y pkg-config libssl-dev && \\
    cargo build --release

CMD ["./target/release/$PROJECT_NAME"]
EOL

# 4. Beispiel-Konfigurationsdatei (TOML)
echo "==> Erstelle Beispiel-Konfigurationsdatei"
cat > config.toml <<EOL
[strategy]
min_premium = 1.0
max_loss = 2.0
position_size = 1000

[api]
ibkr_host = "localhost"
ibkr_port = 4002

[logging]
level = "info"
EOL

# 5. CI/CD Beispiel (Jenkinsfile)
echo "==> Erstelle Beispiel Jenkinsfile"
cat > Jenkinsfile <<EOL
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'cargo build --release'
            }
        }
        stage('Test') {
            steps {
                sh 'cargo test'
            }
        }
        stage('Docker') {
            steps {
                sh 'docker build -t $PROJECT_NAME .'
            }
        }
    }
}
EOL

# 6. Hinweise für den Nutzer
echo "==> Projektstruktur und Grundkonfiguration erstellt!"
echo "Bitte implementiere die Logik in src/main.rs und ggf. in weiteren Modulen."
echo "Starte das Projekt mit: cargo run"
echo "Baue das Docker-Image mit: docker build -t $PROJECT_NAME ."
echo "Nutze die config.toml für Strategie-Parameter."

# 7. Optional: Git initialisieren
git init
git add .
git commit -m "Initial project setup for short put strategy"

# Fertig
echo "==>