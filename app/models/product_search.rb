class ProductSearch < ApplicationRecord
    has_many :products
    has_many :user_searches

    validates :search_term, presence: true

    #crawler module
    def scraper
        s = Scraper.new(search_term,id)
        s.ebay
        s.jumia
    end
end
