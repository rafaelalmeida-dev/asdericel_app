# frozen_string_literal: true

# Associações:
# atleta
# equipe

# Atributos:
<<<<<<<< HEAD:app/models/categoria.rb
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo
class Categoria < ApplicationRecord
========

# Adicione aqui quaisquer métodos ou validações abaixo
class AtletaEquipe < ApplicationRecord
>>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.):app/models/atleta_equipe.rb
  include Datafilter
  self.table_name = "categorias"


  belongs_to :atleta
  belongs_to :equipe

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
<<<<<<<< HEAD:app/models/categoria.rb
      nome
========
>>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.):app/models/atleta_equipe.rb
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      atleta
      equipe
    ]
  end
end
