use serde::Deserialize;
use std::fs;

#[derive(Debug, Deserialize)]
pub struct StrategyConfig {
    pub min_premium: f64,
    pub max_loss: f64,
    pub position_size: u32,
}

#[derive(Debug, Deserialize)]
pub struct ApiConfig {
    pub ibkr_host: String,
    pub ibkr_port: u16,
}

#[derive(Debug, Deserialize)]
pub struct LoggingConfig {
    pub level: String,
}

#[derive(Debug, Deserialize)]
pub struct Config {
    pub strategy: StrategyConfig,
    pub api: ApiConfig,
    pub logging: LoggingConfig,
}

pub fn load_config(path: &str) -> Result<Config, Box<dyn std::error::Error>> {
    let content = fs::read_to_string(path)?;
    let config: Config = toml::from_str(&content)?;
    Ok(config)
}