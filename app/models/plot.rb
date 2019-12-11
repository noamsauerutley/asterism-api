class Plot < ApplicationRecord
  belongs_to :story
  has_many :plot_notes, dependent: :destroy
  has_many :scenes, dependent: :destroy
end
