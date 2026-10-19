FROM ghcr.io/cirruslabs/flutter:stable AS build
WORKDIR /app

COPY pubspec.* ./
RUN flutter pub get

COPY . .

RUN flutter build web --release --base-href="/"


FROM docker.io/library/caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=build /app/build/web /srv

EXPOSE 2019
EXPOSE 80
