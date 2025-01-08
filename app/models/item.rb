class Item < ApplicationRecord
  belongs_to :list
  validates :name, presence: true

  # Adiciona funcionalidade para ordenar os itens
  acts_as_list scope: :list
end
