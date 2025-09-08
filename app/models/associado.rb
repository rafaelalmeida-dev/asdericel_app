# frozen_string_literal: true

# Associações:
# endereco

# Atributos:
# string - nome
# string - nome_social
# string - nome_conhecido
# string - mae
# string - pai
# date - data_nascimento
# integer - sexo
# string - cpf
# string - rg
# string - orgao_emissor
# date - data_expedicao
# string - passaporte
# integer - estado_civil
# string - profissao
# integer - ensino
# string - celular
# string - email
# string - instagram
# string - observacao
# integer - tipo_cadastro

# Adicione aqui quaisquer métodos ou validações abaixo
class Associado < ApplicationRecord
  include Datafilter

  belongs_to :endereco
end
