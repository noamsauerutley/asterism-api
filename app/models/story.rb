class Story < ApplicationRecord
  belongs_to :author
  has_many :characters
  accepts_nested_attributes_for :characters, allow_destroy: true
  has_many :plots
  accepts_nested_attributes_for :plots, allow_destroy: true


end
