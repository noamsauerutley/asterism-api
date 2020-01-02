class Scene < ApplicationRecord
  belongs_to :plot
  has_many :appearances, dependent: :destroy
  has_many :characters, through: :appearances
end
