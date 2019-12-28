class Story < ApplicationRecord
  belongs_to :author
  has_many :characters, dependent: :destroy
  has_many :plots, dependent: :destroy


end
