class Character < ApplicationRecord
  belongs_to :story
  has_many :character_notes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :appearances, dependent: :destroy
  has_many :scenes, through: :appearances
end
