# frozen_string_literal: true

# Associações:

# Atributos:
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo
class Cidade < ApplicationRecord
  include Datafilter

  def self.ransackable_attributes(auth_object = nil)
    [ "nome" ]
  end
  def self.ransackable_associations(auth_object = nil)
    [ "nome" ]
  end
end
