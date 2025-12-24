# frozen_string_literal: true

# Associações:

# Atributos:
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo

class Modalidade < ApplicationRecord
  include Datafilter

  has_and_belongs_to_many :categorias

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[nome]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[categorias]
  end

  def to_s
    nome
  end
end
