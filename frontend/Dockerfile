# ----------------------------------------------------
# 1. BUILD STAGE (Compilación de la SPA React)
# ----------------------------------------------------
# Usamos una imagen base para desarrollo/construcción
FROM node:20-alpine AS builder

WORKDIR /app/frontend
COPY frontend/package*.json ./
# Instalamos dependencias
RUN npm install

# Copiamos el código fuente
COPY frontend/ .

# Compilamos la aplicación. Esto genera la carpeta 'build/'
# La variable REACT_APP_API_BASE_URL debe ser seteada aquí si es necesaria en el build
ARG REACT_APP_API_BASE_URL
ENV REACT_APP_API_BASE_URL=$REACT_APP_API_BASE_URL
RUN npm run build

# ----------------------------------------------------
# 2. PRODUCTION STAGE (Servir archivos estáticos con Nginx)
# ----------------------------------------------------
# Usamos una imagen muy ligera y segura (nginx) para servir los archivos
FROM nginx:stable-alpine

# Copiamos los archivos estáticos compilados del 'builder' stage
COPY --from=builder /app/frontend/build /usr/share/nginx/html

# Puerto estándar de Nginx
EXPOSE 80

# El comando de inicio de Nginx es el default
CMD ["nginx", "-g", "daemon off;"]