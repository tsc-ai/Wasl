# --- Rust Multi-Stage Dockerfile for Development ---

# Stage 1: Build the application
FROM rust:1.64 as builder
WORKDIR /usr/src/app

# Copy the Cargo files and build a dummy project to cache dependencies
COPY Cargo.toml Cargo.lock ./
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release
RUN rm -f target/release/deps/wasl_sync*

# Now copy the actual source code
COPY ./src ./src

# Build the final binary
RUN cargo build --release

# Stage 2: Create a minimal final image
FROM debian:bullseye-slim
WORKDIR /usr/src/app

# Copy the compiled binary from the builder stage
COPY --from=builder /usr/src/app/target/release/wasl-sync .

# Run the binary
CMD ["./wasl-sync"]
