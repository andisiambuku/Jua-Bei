class ProductSearch < ApplicationRecord
    has_many :products
    has_many :user_searches
    attr_accessor :product_search_id

    validates :search_term, presence: true

    def self.search_history(user_id)
        ProductSearch.joins(:user_searches).where(user_searches: {user_id: user_id})
      end
    
end
# after_create :scraper

    # #crawler module
    # def scraper
    #     s = Scraper.new(search_term,id)
    #     s.ebay
    #     s.jumia
    #     s.amazon
    # end
