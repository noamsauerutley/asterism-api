class Character < ApplicationRecord
  belongs_to :story
  has_one :gallery, dependent: :destroy
  has_many :character_notes, dependent: :destroy
  has_many :appearances, dependent: :destroy
end
