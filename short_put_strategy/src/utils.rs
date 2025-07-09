// This file contains utility functions that are used across the project.

/// Calculates the profit from a short put option at expiration.
/// Returns the net profit (premium received minus any loss if assigned).
pub fn calculate_profit(premium_received: f64, strike_price: f64, stock_price_at_expiration: f64) -> f64 {
    if stock_price_at_expiration < strike_price {
        premium_received - (strike_price - stock_price_at_expiration)
    } else {
        premium_received
    }
}

/// Calculates the risk (loss) from a short put option at expiration.
/// Returns the loss amount if assigned, otherwise zero.
pub fn calculate_risk(strike_price: f64, stock_price_at_expiration: f64) -> f64 {
    if stock_price_at_expiration < strike_price {
        strike_price - stock_price_at_expiration
    } else {
        0.0
    }
}