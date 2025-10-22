# frozen_string_literal: true

# Associações:
# pessoa
# modalidade
# federacao

# Atributos:
# string - cref

# Adicione aqui quaisquer métodos ou validações abaixo
class Dirigente < ApplicationRecord
  include Datafilter

  belongs_to :pessoa
  belongs_to :modalidade, optional: true
  belongs_to :calca, optional: true
  belongs_to :camisa, optional: true
  belongs_to :ensino, optional: true
  belongs_to :endereco, optional: true
  has_many   :dirigente_federacoes, dependent: :destroy
  has_many   :federacoes, through: :dirigente_federacoes


  accepts_nested_attributes_for :pessoa
  accepts_nested_attributes_for :endereco
  accepts_nested_attributes_for :dirigente_federacoes, allow_destroy: true

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      cref
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      pessoa
      modalidade
      federacao
    ]
  end
end
