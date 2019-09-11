
# # stage: 1
# FROM node:10 AS react-build
# WORKDIR /app
# COPY . /app
# RUN yarn
# RUN yarn build
# # stage: 2
# FROM nginx:alpine
# COPY --from=react-build /app/build /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

FROM nginx:alpine

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY /build /usr/share/nginx/html

CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
