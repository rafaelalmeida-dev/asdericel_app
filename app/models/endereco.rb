# frozen_string_literal: true

# Associações:

# Atributos:
# string - cep
# string - logradouro
# string - bairro
# string - localidade
# string - uf
# string - pais
# string - numero

# Adicione aqui quaisquer métodos ou validações abaixo
class Endereco < ApplicationRecord
  include Datafilter
end
