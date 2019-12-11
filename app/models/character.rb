class Character < ApplicationRecord
  belongs_to :story
  has_one :gallery, dependent: :destroy
  has_many :notes, dependent: :destroy
end
