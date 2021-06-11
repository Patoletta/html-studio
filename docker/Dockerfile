FROM nginx:1.20.0-alpine

COPY /docker/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY /public /usr/share/nginx/html

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && \
    nginx -g 'daemon off;'