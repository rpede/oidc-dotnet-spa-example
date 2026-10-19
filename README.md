# OpenID Connect, ASP.NET + SPA

## Setup

```sh
cp example.env .env
```

Change KEYCLOAK_ADMIN_PASSWORD and CLIENT_SECRET

```sh
source .env
dotnet user-secrets set "OpenIDConnectSettings:ClientSecret" "$CLIENT_SECRET" --project backend
docker compose up
```

Add the following line to `/etc/hosts` or `C:\Windows\System32\drivers\etc\hosts` :

```
127.0.0.1 keycloak
```

Open <http://localhost>

Login with one of the credentials found in `./keycloak/realm/vulntrack.json`

**Note:** you likely get 500 on redirect to <http://localhost/Auth/Callback>,
in that case just load <http://localhost> again.
