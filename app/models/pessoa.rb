# frozen_string_literal: true

# Associações:
# sexo
# estadocivil
# funcao

# Atributos:
# string - nome
# string - nome_social
# string - nomeconhecido
# string - pai
# string - mae
# date - data_nascimento
# string - cpf
# integer - cinrg
# string - orgaoemissor
# date - dataexpedicao
# string - passaporte
# string - profissao

# Adicione aqui quaisquer métodos ou validações abaixo
class Pessoa < ApplicationRecord
  include Datafilter

  has_one :associado
  
  belongs_to :sexo
  belongs_to :estadocivil
  # belongs_to :ensino
  belongs_to :funcao
  

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      nome
      nomesocial
      nomeconhecido
      pai
      mae
      datanascimento
      cpf
      cinrg
      orgaoemissor
      dataexpedicao
      passaporte
      profissao
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      sexo
      estadocivil
      ensino
      funcao
    ]
  end
  def to_s
    nome
  end
end
