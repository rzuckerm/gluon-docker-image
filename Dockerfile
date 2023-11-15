FROM rust:1.73.0-slim-bookworm

COPY GLUON_* /tmp/
RUN apt-get update && \
    apt-get install -y git && \
    cargo install gluon_repl@$(cat /tmp/GLUON_VERSION) && \
    apt-get remove -y git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
