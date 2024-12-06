require 'sinatra'
require 'json'

# Ruta para la raíz
get '/' do
  "¡Bienvenido al servidor de Webhooks! Usa la ruta /webhook para enviar datos."
end

# Ruta para el Webhook
post '/webhook' do
  request_body = request.body.read
  payload = JSON.parse(request_body) rescue {}

  # Imprimir el payload recibido
  puts "Payload recibido: #{payload}"

  # Responder al cliente
  content_type :json
  { message: "¡Hola Mundo desde un Webhook!", data: payload }.to_json
end

# Configuración para escuchar en todas las interfaces
set :bind, '0.0.0.0'

