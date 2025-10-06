class Role < ApplicationRecord
  include Datafilter
  validates :nome, presence: true, uniqueness: true

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      nome
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
    ]
  end
  def to_s
    nome
  end
end