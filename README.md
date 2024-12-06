# Webhook Hola Mundo con Sinatra

Este proyecto implementa un servidor básico de Webhook utilizando **Sinatra** (en Ruby) y está configurado para ejecutarse dentro de un contenedor Docker. Es ideal para aprender sobre Webhooks, Sinatra y cómo dockerizar aplicaciones.

## Descripción

El servidor expone dos endpoints principales:
1. **GET** `/`: Devuelve un mensaje de bienvenida.
2. **POST** `/webhook`: Recibe un payload JSON y devuelve una respuesta con los datos recibidos.

Este proyecto es perfecto para explorar conceptos básicos de Webhooks y cómo integrarlos en sistemas más grandes.

## Características

- Implementado en **Ruby** con el framework **Sinatra**
- Configuración completa para ser ejecutado en Docker
- Compatible con cualquier sistema operativo que soporte Docker
- Fácil de probar con herramientas como **curl** y **Postman**

## Instalación

### Requisitos previos

- Ruby (si deseas ejecutarlo localmente)
- Docker (para ejecutarlo en contenedores)
- Postman o **curl** (opcional, para pruebas)

### Configuración local

1. Clona este repositorio:
   ```bash
   git clone https://github.com/TU_USUARIO/TU_REPOSITORIO.git
   cd webhook-hola-mundo
   ```

2. Instala las dependencias:
   ```bash
   bundle install
   ```

3. Ejecuta el servidor:
   ```bash
   ruby webhook.rb
   ```

4. Accede a la API en:
   - http://localhost:4567/ (para `GET /`)
   - http://localhost:4567/webhook (para `POST /webhook`)

## Ejecución con Docker

### 1. Construir la imagen
Construye la imagen Docker:
```bash
docker build -t sinatra-webhook .
```

### 2. Ejecutar el contenedor
Inicia el contenedor con mapeo de puertos:
```bash
docker run -p 4567:4567 --name sinatra-webhook-container sinatra-webhook
```

### 3. Acceso
Accede a los endpoints en:
- http://localhost:4567/ (`GET /`)
- http://localhost:4567/webhook (`POST /webhook`)

## Uso

### GET `/`
- Devuelve un mensaje de bienvenida.
- **Ejemplo de respuesta**:
  ```
  ¡Bienvenido al servidor de Webhooks! Usa la ruta /webhook para enviar datos.
  ```

### POST `/webhook`
- Recibe un payload JSON y devuelve los datos enviados.
- **Ejemplo de solicitud**:
  ```json
  {
    "event": "test",
    "message": "Hola desde Webhook"
  }
  ```
- **Ejemplo de respuesta**:
  ```json
  {
    "message": "¡Hola Mundo desde un Webhook!",
    "data": {
      "event": "test",
      "message": "Hola desde Webhook"
    }
  }
  ```

## Pruebas rápidas

### Con curl
```bash
curl -X POST http://localhost:4567/webhook \
     -H "Content-Type: application/json" \
     -d '{"event": "test", "message": "Hola desde Webhook"}'
```

### Con Postman
- Método: `POST`
- URL: http://localhost:4567/webhook
- Headers: `Content-Type: application/json`
- Body:
  ```json
  {
    "event": "test",
    "message": "Hola desde Webhook"
  }
  ```

