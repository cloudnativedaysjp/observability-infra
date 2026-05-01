# ver. の上げ方

- 以下を確認してリリースされている ver. を把握する
  - https://github.com/open-telemetry/opentelemetry-collector/releases
  - https://github.com/open-telemetry/opentelemetry-collector-contrib/releases
- `builder-config.yaml` の各モジュールの ver. を上げる
- `go get go.opentelemetry.io/collector/cmd/builder@latest` を実行する
- `make generate-otelcol` で collector のコードを生成する
- git commit し、pull request を作る

# install の仕方 (初回のみ)

- AMD64 版の otelcol を install する
  - [Install the Collector | OpenTelemetry#DEB Installation](https://opentelemetry.io/docs/collector/installation/#deb-installation])
- Mackerel の API key を設定する
  - `/etc/otelcol/otelcol.conf` に `MACKEREL_APIKEY="〜"` を追記する
- 以下、otelcol を deploy する

# deploy の仕方

- (otelcol をインストールしていなければ) dpkg で otelcol を入れる
  - [コレクターのインストール | OpenTelemetry#debのインストール](https://opentelemetry.io/ja/docs/collector/installation/#deb%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)
  - `/etc/otelcol/otelcol.conf` に `MACKEREL_APIKEY` 環境変数を設定する
- `cp 云々/otelcol-config/otelcol-云々-config.yaml /etc/otelcol/otelcol.conf` で collector の設定ファイルを設置する
- otelcol 実行ファイルをビルドする
  - ```sh
    cd otelcol-config
    make build
    ```
- otelcol 実行ファイルを置き換える
  - ```sh
    sudo systemctl stop otelcol
    sudo cp otelcol/otelcol /usr/bin/otelcol
    sudo systemctl start otelcol
    ```
