class Product < ApplicationRecord
    belongs_to :product_search

    def self.search(search_term)
        Product.joins(:product_search).where("product_searches.search_term = ?", search_term)
    end
end
