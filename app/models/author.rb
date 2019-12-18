class Author < ApplicationRecord
    has_secure_password

    has_many :stories, dependent: :destroy
    accepts_nested_attributes_for :stories, allow_destroy: true

    has_many :characters, through: :stories, dependent: :destroy
    accepts_nested_attributes_for :characters, allow_destroy: true

    has_many :plots, through: :stories, dependent: :destroy
    accepts_nested_attributes_for :plots, allow_destroy: true

    has_many :fragments, dependent: :destroy


    validates_presence_of :username
    validates_uniqueness_of :username, :case_sensitive => false

end
