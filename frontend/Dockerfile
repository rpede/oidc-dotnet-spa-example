ARG FLUTTER_VERSION=stable
FROM ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION} AS build

WORKDIR /app

# Resolve dependencies first so this layer is cached until pubspec changes
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the source and build
COPY . .

# Set to "/myapp/" if you serve from a sub-path
ARG BASE_HREF=/
RUN flutter build web --release --base-href="${BASE_HREF}"

# ---------- Stage 2: serve with Caddy ----------
FROM docker.io/library/caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=build /app/build/web /usr/share/caddy

EXPOSE 1234

# Caddy's official image already runs: caddy run --config /etc/caddy/Caddyfile
