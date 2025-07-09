FROM rust:1.77-slim-buster

# Install system dependencies
RUN apt-get update && \
    apt-get install -y pkg-config libssl-dev ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy source code
COPY . .

# Build the application in release mode
RUN cargo build --release

# Set environment variables (optional, for logging etc.)
ENV RUST_LOG=info

# Run the binary
CMD ["./target/release/short_put_strategy"]