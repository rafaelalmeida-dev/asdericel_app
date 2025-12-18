# frozen_string_literal: true

# Associações:

# Atributos:
# string - titulo
# text - conteudo
# string - categoria
# string - imagem
# date - data_publicacao
# boolean - destaque

# Adicione aqui quaisquer métodos ou validações abaixo
class Noticium < ApplicationRecord
  include Datafilter


  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      titulo
      conteudo
      categoria
      imagem
      data_publicacao
      destaque
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
    ]
  end
end
