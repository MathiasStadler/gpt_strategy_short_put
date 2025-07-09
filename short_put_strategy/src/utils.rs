// This file contains utility functions that are used across the project.

pub fn calculate_profit(premium_received: f64, strike_price: f64, stock_price_at_expiration: f64) -> f64 {
    if stock_price_at_expiration < strike_price {
        return premium_received - (strike_price - stock_price_at_expiration);
    }
    premium_received
}

pub fn calculate_risk(strike_price: f64, stock_price_at_expiration: f64) -> f64 {
    if stock_price_at_expiration < strike_price {
        return strike_price - stock_price_at_expiration;
    }
    0.0
}