FROM nginx:alpine

# curl 설치 (헬스체크용)
RUN apk add --no-cache curl

# nginx 설정 템플릿 복사
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# 앱 파일 복사
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 3000

CMD ["/bin/sh", "-c", "export PORT=${PORT:-3000} && envsubst '$PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
