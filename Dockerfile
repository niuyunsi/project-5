# FROM node:10 as react-build

# ENV PATH=$PATH:/node_modules/.bin

# COPY package.json /package.json
# RUN yarn

# WORKDIR /app
# COPY . /app

# EXPOSE 3000
# EXPOSE 35729

# ENTRYPOINT ["/bin/bash", "/app/run.sh"]
# CMD ["start"]

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
COPY /build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]