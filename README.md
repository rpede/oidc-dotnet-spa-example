# OpenID Connect, ASP.NET + SPA

## Pre-requisites

- Docker
  - [Install Docker Desktop on Windows](https://docs.docker.com/desktop/setup/install/windows-install/)
  - [Install Docker Desktop on Mac](https://docs.docker.com/desktop/setup/install/mac-install/)
  - [Install Docker Desktop on Linux](https://docs.docker.com/desktop/setup/install/linux/)
- [Flutter SDK](https://docs.flutter.dev/install/quick).
- [.NET 10](https://dotnet.microsoft.com/en-us/download/dotnet/10.0)

For a full docker setup, checkout `dockerize` branch.

## Setup

```sh
cp example.env .env
```

Change KEYCLOAK_ADMIN_PASSWORD and CLIENT_SECRET

Configure user-secrets for .NET project

```sh
source .env
cd backend
dotnet user-secrets set "OpenIDConnectSettings:ClientSecret" "$CLIENT_SECRET"
cd ..
```

Start keycloak.
It will import configuration from `./keycloak/realm/vulntrack.json`

```sh
docker compose up
```

Start frontend.

```sh
cd frontend
flutter run
```

Start backend.

```sh
cd backend
dotnet run
```

Open <http://localhost:1234>

Login for test users

```sh
jq '.["users"]' keycloak/realm/vulntrack.json 
```
