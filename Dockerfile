FROM node:lts-alpine as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html/apps/tic-tac-toe

EXPOSE 80

# Reports whether nginx is serving the app; it restarts nothing by itself.
# The app lives under /apps/tic-tac-toe/, so that's the path that answers 200
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
    CMD wget -q --spider http://127.0.0.1/apps/tic-tac-toe/ || exit 1

CMD ["nginx", "-g", "daemon off;"]