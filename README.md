# observability-infra

## Grafana

### How to use?

`.env.example` をコピーして `.env` を作成し、中身を修正します。

```sh
GF_AUTH_GENERIC_OAUTH_CLIENT_ID = <auth0 client-id>
GF_AUTH_GENERIC_OAUTH_CLIENT_SECRET = <auth0 client-secret>
GF_INSTALL_PLUGINS = grafana-piechart-panel, grafana-bigquery-datasource
```

`srg|prod/secrets/` に BigQuery と接続するための秘密鍵を格納します。（鍵は、`Observability` チームメンバから共有してもらうこと）

Grafana 用のボリュームを作成します。

```bash
docker volume create grafana-data
```

Grafana を起動します。

```bash
docker compose -f compose.grafana.yml -f stg/grafana/compose.grafana.staging.yml up -d
```
