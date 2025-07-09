// This file is the entry point of the application. It initializes the program, calls the necessary functions to analyze stock data, and implements the short put strategy.

mod analysis;
mod data;
mod strategy;
mod utils;

fn main() {
    // Fetch stock data
    let stock_data = data::fetch_stock_data();

    // Analyze stocks to find suitable candidates for the short put strategy
    let suitable_stocks = analysis::analyze_stocks(stock_data);

    // Execute the short put strategy for each suitable stock
    for stock in suitable_stocks {
        let strike_price = stock.strike_price; // Example value, replace with actual logic
        let expiration_date = stock.expiration_date; // Example value, replace with actual logic
        let (profit, risk) = strategy::execute_short_put(stock, strike_price, expiration_date);

        // Output the results
        println!("Stock: {}, Potential Profit: {}, Risk: {}", stock.name, profit, risk);
    }

    // --- New code: Find the best short put option for a given ticker for next week ---
    let ticker = "AAPL"; // Example ticker, you can change or loop over candidates
    match data::fetch_best_option_yahoo(ticker) {
        Some(option) => {
            println!(
                "Best short put for {}: Strike ${}, Expiry {}, Premium ${}",
                option.name, option.strike_price, option.expiration_date, option.premium
            );
        }
        None => println!("No suitable short put option found for {}", ticker),
    }
}