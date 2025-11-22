FROM ruby:3.4.1

# Dependências do sistema
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev curl gnupg2

# Instala Node.js + npm (NodeSource)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Instala Yarn globalmente
RUN npm install --global yarn

# Cria diretório da app
WORKDIR /app

# Copia Gemfile e Gemfile.lock
COPY Gemfile* ./

# Instala gems
RUN bundle config set force_ruby_platform true
RUN bundle install

# Copia o restante da aplicação
COPY . .

# Porta padrão Rails
EXPOSE 3000

# Comando para rodar a app
CMD ["bash", "-c", "bundle exec rails db:prepare && bundle exec rails server -b 0.0.0.0"]
