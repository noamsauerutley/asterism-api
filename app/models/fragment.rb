class Fragment < ApplicationRecord
  belongs_to :author
  has_many :fragment_notes, dependent: :destroy
end
