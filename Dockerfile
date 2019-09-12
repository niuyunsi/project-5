FROM nginx:alpine

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY /build /usr/share/nginx/html

# Use template and Heroku assigned port to create a new nginx config and replace the default one
CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
