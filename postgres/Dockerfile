# Use an official PostgreSQL image with AGE build dependencies.
FROM postgres:14-alpine

# Install Apache AGE dependencies
RUN apk add --no-cache build-base clang llvm13-dev flex bison

# Set environment variable for AGE build
ENV PG_CONFIG /usr/local/bin/pg_config

# Clone and build AGE from source
RUN git clone https://github.com/apache/age.git && \
    cd age && \
    make && \
    make install

# Note: The DB will still need the extension created on first run.
# This could be handled by an init script in docker-entrypoint-initdb.d
