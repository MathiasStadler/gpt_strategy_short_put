// This file handles data retrieval and processing. It exports functions `fetch_stock_data` to retrieve stock information from open-source APIs and `process_data` to clean and format the data for analysis.

use reqwest::blocking::get;
use serde::Deserialize;

#[derive(Deserialize)]
struct StockData {
    symbol: String,
    price: f64,
    // Add other relevant fields as necessary
}

pub fn fetch_stock_data(api_url: &str) -> Result<Vec<StockData>, Box<dyn std::error::Error>> {
    let response = get(api_url)?.json::<Vec<StockData>>()?;
    Ok(response)
}

pub fn process_data(data: Vec<StockData>) -> Vec<StockData> {
    // Implement data processing logic here
    // For example, filter stocks based on certain criteria
    data.into_iter()
        .filter(|stock| stock.price > 0.0) // Example condition
        .collect()
}