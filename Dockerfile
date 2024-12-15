# php と composerをインストールしてある環境を作成する
# まずはベースとなるphpのイメージを取得
FROM php:8.3-fpm

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    wget \
    git \
    unzip \
    libzip-dev \
    zip \
    libxml2-dev \
    && docker-php-ext-install zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

# symfony cliをインストール
RUN curl -sS https://get.symfony.com/cli/installer | bash

# symfony cliを使えるようにする
RUN mv /root/.symfony*/bin/symfony /usr/local/bin/symfony

# 作業ディレクトリを指定
WORKDIR /app