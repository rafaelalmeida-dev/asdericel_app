# frozen_string_literal: true

# Associações:

# Atributos:
# string - nome
# string - edicacao
# string - promotor
# string - local
# datetime - datainicio
# datetime - datafim

# Adicione aqui quaisquer métodos ou validações abaixo
class Evento < ApplicationRecord
  include Datafilter


  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      nome
      edicacao
      promotor
      local
      datainicio
      datafim
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
    ]
  end
end
