FROM nginx:alpine

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY /build /usr/share/nginx/html

CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
