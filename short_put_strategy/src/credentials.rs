use std::fs;
use serde::Deserialize;

#[derive(Debug, Deserialize)]
pub struct Credentials {
    pub username: String,
    pub password: String,
    pub host: String,
    pub port: u16,
}

pub fn load_credentials(path: &str) -> Result<Credentials, Box<dyn std::error::Error>> {
    let content = fs::read_to_string(path)?;
    let creds: Credentials = toml::from_str(&content)?;
    Ok(creds)
}