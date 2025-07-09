# filepath: /home/trapapa/gpt_strategy_short_put/setup_project.sh
#!/bin/bash
set -e

PROJECT_NAME="short_put_strategy"
echo "==> Initializing Rust project: $PROJECT_NAME"
cargo new $PROJECT_NAME --bin
cd $PROJECT_NAME

echo "==> Adding dependencies"
cat >> [Cargo.toml](http://_vscodecontentref_/0) <<EOL

[dependencies]
ibkr-rust = "0.7"
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

echo "==> Creating Dockerfile"
cat > Dockerfile <<EOL
FROM rust:1.77-slim-buster

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y pkg-config libssl-dev && \\
    cargo build --release

CMD ["./target/release/$PROJECT_NAME"]
EOL

echo "==> Creating example config.toml"
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

echo "==> Creating example credentials.toml"
cat > credentials.toml <<EOL
username = "demo_user"
password = "demo_password"
host = "localhost"
port = 4002
EOL

git init
git add .
git commit -m "Initial project setup for short put strategy"

echo "==> Setup complete!"