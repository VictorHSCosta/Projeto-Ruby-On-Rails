class Item < ApplicationRecord
  belongs_to :list
  validates  :name, presence: true
  validates  :description, presence: true, length: { minimum: 5 }

  # Adiciona funcionalidade para ordenar os itens
  acts_as_list scope: :list
end
