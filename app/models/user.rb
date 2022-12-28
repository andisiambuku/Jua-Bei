class User < ApplicationRecord
has_many :user_searches

has_many :product_searches through: :user_searches

end
