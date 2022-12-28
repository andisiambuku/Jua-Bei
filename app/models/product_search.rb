class ProductSearch < ApplicationRecord
    has_many :products
    has_many :user_searches
end
