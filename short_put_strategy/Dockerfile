FROM rust:1.77-slim-buster

RUN apt-get update && \
    apt-get install -y pkg-config libssl-dev ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN cargo build --release

ENV RUST_LOG=info

CMD ["./target/release/short_put_strategy"]