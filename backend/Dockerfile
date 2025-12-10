# ----------------------------------------------------
# 1. BUILD STAGE (Compilación de TypeScript)
# ----------------------------------------------------
# Usamos una imagen base ligera para el build
FROM node:20-alpine AS builder

WORKDIR /app/backend
# Copiamos solo los archivos de dependencias para aprovechar el caché
COPY backend/package*.json ./
# Instalamos dependencias de desarrollo y producción
RUN npm install

# Copiamos el código fuente
COPY backend/ .
# Compilamos el TypeScript. Esto crea la carpeta 'dist/'
RUN npm run build

# ----------------------------------------------------
# 2. PRODUCTION STAGE (Solo ejecución)
# ----------------------------------------------------
# Usamos la misma imagen base ligera para producción
FROM node:20-alpine

# Definimos el puerto (aunque también se definirá en docker-compose/EC2)
ENV PORT 5000
WORKDIR /app

# Copiamos solo las dependencias de producción del backend
COPY backend/package*.json ./
# Solo instalamos dependencias de producción (más ligeras)
RUN npm install --only=production

# Copiamos el código compilado desde el 'builder' stage
COPY --from=builder /app/backend/dist ./dist

# Comando para iniciar la aplicación (referencia a "start": "node dist/server.js" en package.json)
CMD [ "node", "dist/server.js" ]