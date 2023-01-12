class ProductSearch < ApplicationRecord
    has_many :products
    has_many :user_searches

    validates :search_term, presence: true
end
