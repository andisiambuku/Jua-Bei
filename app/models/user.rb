class User < ApplicationRecord
    # has_many :product_searches through: :user_searches
    has_many :user_searches
    #add user validations
    validates :username, uniqueness: { case_sensitive: false }
end
