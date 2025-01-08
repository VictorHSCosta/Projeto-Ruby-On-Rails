class List < ApplicationRecord
  belongs_to :user
  has_many :items, -> { order(position: :asc) }, dependent: :destroy

  validates :name, presence: true
end

