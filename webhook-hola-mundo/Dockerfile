# Usa una imagen base de Ruby
FROM ruby:3.2

# Instala dependencias necesarias
RUN apt-get update -qq && apt-get install -y build-essential

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia las gemas necesarias
COPY Gemfile Gemfile.lock ./

# Instala las gemas
RUN bundle install

# Copia el resto de los archivos del proyecto
COPY . .

# Expone el puerto 4567
EXPOSE 4567

# Comando para iniciar el servidor
CMD ["ruby", "webhook.rb"]
