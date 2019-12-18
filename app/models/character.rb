class Character < ApplicationRecord
  belongs_to :story
  has_many :character_notes
  accepts_nested_attributes_for :character_notes, allow_destroy: true
  has_one :gallery, dependent: :destroy
  accepts_nested_attributes_for :gallery
  has_many :appearances
  accepts_nested_attributes_for :appearances, allow_destroy: true
end
