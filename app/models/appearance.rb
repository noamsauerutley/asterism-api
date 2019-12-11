class Appearance < ApplicationRecord
  belongs_to :scene
  belongs_to :character
  has_many :appearance_notes, dependent: :destroy
end
