# frozen_string_literal: true

# Associações:

# Atributos:
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo

class Categoria < ApplicationRecord
  include Datafilter
  self.table_name = "categorias"

  has_and_belongs_to_many :modalidades

  def self.ransackable_attributes(auth_object = nil)
    %w[nome]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[modalidades]
  end
end
