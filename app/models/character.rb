class Character < ApplicationRecord
  belongs_to :story
  has_many :character_notes, dependent: :destroy
  has_one :gallery, dependent: :destroy
  has_many :images, through: :gallery
  has_many :appearances, dependent: :destroy
  has_many :scenes, through: :appearances
end
