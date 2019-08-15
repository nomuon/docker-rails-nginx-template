FROM nginx:1.15.10-alpine

# コンテナ内に存在するNginxの設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

# Nginxを起動
CMD ["nginx", "-g", "daemon off;"]