# --- Rust Multi-Stage Dockerfile for Development & Production ---
# This Dockerfile is optimized to cache dependencies correctly without
# requiring a Cargo.lock file to exist on the host machine.

# Stage 1: The Planner
# This stage's only job is to resolve dependencies and generate Cargo.lock.
FROM rust:1.64 as planner
WORKDIR /usr/src/app
COPY ./Cargo.toml ./
# This command creates a dummy project and generates Cargo.lock
RUN cargo install cargo-chef && \
    mkdir src && \
    echo "fn main() {}" > src/main.rs && \
    cargo chef prepare --recipe-path recipe.json

# Stage 2: The Builder
# This stage builds the dependencies, caching them in a separate layer.
FROM rust:1.64 as builder
WORKDIR /usr/src/app
# Copy the dependency recipe and Cargo.lock from the planner stage
COPY --from=planner /usr/src/app/recipe.json recipe.json
COPY --from=planner /usr/src/app/Cargo.lock ./
# Build the dependencies. This layer is cached as long as Cargo.lock doesn't change.
RUN cargo install cargo-chef && \
    cargo chef cook --release --recipe-path recipe.json

# Now, copy the application source code and build it
COPY ./Cargo.toml ./
COPY ./src ./src
RUN cargo build --release

# Stage 3: The Final Image
# Create a minimal final image for a small footprint.
FROM debian:bullseye-slim
WORKDIR /usr/src/app

# Copy the compiled binary from the builder stage
COPY --from=builder /usr/src/app/target/release/wasl-sync .

# Run the binary
CMD ["./wasl-sync"]
