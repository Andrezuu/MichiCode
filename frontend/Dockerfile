# ----------------------------------------------------
# 1. BUILD STAGE (Compilación de la SPA React)
# ----------------------------------------------------
FROM node:20-alpine AS builder 

# CRÍTICO: Usar un WORKDIR estándar, ej. /usr/src/app (o /app)
WORKDIR /usr/src/app
# No es necesario usar el nombre de la subcarpeta 'frontend'
COPY package*.json ./
RUN npm install
COPY . .
ARG REACT_APP_API_BASE_URL
ENV REACT_APP_API_BASE_URL=${REACT_APP_API_BASE_URL}
RUN npm run build

# ----------------------------------------------------
# 2. PRODUCTION STAGE (Servir archivos estáticos con Nginx)
# ----------------------------------------------------
FROM nginx:stable-alpine

RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/conf.d/default.conf

# ¡CRÍTICO! Copia el contenido de /usr/src/app/build a la ubicación de Nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]