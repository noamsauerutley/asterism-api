class Gallery < ApplicationRecord
  belongs_to :character
  has_many :images, dependent: :destroy
end
