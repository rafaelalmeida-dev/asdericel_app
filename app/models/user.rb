# frozen_string_literal: true

# Atributos:

# Adicione aqui quaisquer métodos ou validações abaixo
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include Datafilter
  belongs_to :role
  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      nome
      cpf
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      role
    ]
  end
end
