class ProductSearch < ApplicationRecord
    has_many :products
    has_many :user_searches

    validates :search_term, presence: true

    after_create :scraper

    #crawler module
    def scraper
        s = Scraper.new(search_term,id)
        s.ebay
        s.jumia
        s.amazon
    end
end
