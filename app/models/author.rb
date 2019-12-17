class Author < ApplicationRecord
    has_secure_password

    has_many :stories, dependent: :destroy
    has_many :plots, through: :stories, dependent: :destroy
    has_many :fragments, dependent: :destroy

    validates_presence_of :username
    validates_uniqueness_of :username, :case_sensitive => false

end
