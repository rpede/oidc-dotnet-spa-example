# OpenID Connect, ASP.NET + SPA

## Setup

```sh
cp example.env .env
```

Change KEYCLOAK_ADMIN_PASSWORD and CLIENT_SECRET

```sh
source .env
cd backend
dotnet user-secrets set "OpenIDConnectSettings:ClientSecret" "$CLIENT_SECRET"
cd ..
docker compose up
```
