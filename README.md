# observability-infra

## How to use?(stg)

`.env.example` をコピーして `.env` を作成し、中身を修正します。

```sh
GF_AUTH_GENERIC_OAUTH_CLIENT_ID = <auth0 client-id>
GF_AUTH_GENERIC_OAUTH_CLIENT_SECRET = <auth0 client-secret>
GF_INSTALL_PLUGINS = grafana-piechart-panel, grafana-bigquery-datasource
BASIC_AUTHN_USERNAME = <prometheus-basic-authn-username>
BASIC_AUTHN_PASSWORD = <prometheus-basic-authn-password>
```

`srg/grafana/secrets/` に BigQuery と接続するための秘密鍵を格納します。（鍵は、`Observability` チームメンバから共有してもらうこと）

Grafana/Prometheus/Loki 用のボリュームを作成します。

```bash
docker volume create grafana-data
docker volume create prometheus-data
docker volume create loki-data
```

監視スタックを起動します。

```bash
docker compose -f compose.yml -f stg/compose.stg.yml up -d
```

## How to use?(prod)

`.env.example` をコピーして `.env` を作成し、中身を修正します。

```sh
GF_AUTH_GENERIC_OAUTH_CLIENT_ID = <auth0 client-id>
GF_AUTH_GENERIC_OAUTH_CLIENT_SECRET = <auth0 client-secret>
GF_INSTALL_PLUGINS = grafana-piechart-panel, grafana-bigquery-datasource
BASIC_AUTHN_USERNAME = <prometheus-basic-authn-username>
BASIC_AUTHN_PASSWORD = <prometheus-basic-authn-password>
```

`prod/grafana/secrets/` に BigQuery と接続するための秘密鍵を格納します。（鍵は、`Observability` チームメンバから共有してもらうこと）

Grafana/Prometheus/Loki 用のボリュームを作成します。

```bash
docker volume create grafana-data
docker volume create prometheus-data
docker volume create loki-data
```

監視スタックを起動します。

```bash
docker compose -f compose.yml -f prod/compose.prod.yml up -d
```
