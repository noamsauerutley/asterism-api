class Scene < ApplicationRecord
  belongs_to :plot
  has_many :appearances, dependent: :destroy
end
