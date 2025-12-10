# ----------------------------------------------------
# 1. BUILD STAGE (Compilación de la SPA React)
# ----------------------------------------------------
# AÑADIMOS EL NOMBRE 'builder' AQUÍ:
FROM node:20-alpine AS builder 

WORKDIR /app/frontend
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

# Mejor práctica de seguridad: Actualizar paquetes
RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

# Corregido en el paso anterior
COPY nginx.conf /etc/nginx/conf.d/default.conf

# La referencia 'builder' ahora apunta a la etapa anterior
COPY --from=builder /app/frontend/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]