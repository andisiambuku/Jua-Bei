
class ProductSearchesController < ApplicationController
    before_action :authorized, only: [:history]

    # method to create a search and get a result 
    def create
        title = params[:search_term]
        search = ProductSearch.find_by(search_term: title)

        if search && search.products.length.zero?
            search.update(count: 1)
            search.scraper
        elsif search
            search.update(count: search.count + 1 )
        end

        search ||= ProductSearch.create(search_term: title)
         UserSearch.create(user_id: current_user.id, search_id: search.id) if logged_in?
        render json: search.products, status: :ok
        
        
    end

    #method to get the user search history
    def history
        
        render json: current_user.product_searches.uniq(&:search_term), status: :ok    
    end




end

# def index
#     search_term = SearchTerm.create(search_term: params[:search_term])
#     results = []
#     ecommerce_sites = ['site1', 'site2', 'site3', 'site4']
#     ecommerce_sites.each do |site|
#       url = "https://#{site}.com/api/search?q=#{search_term.search_term}"
#       response = HTTParty.get(url)
#       result = JSON.parse(response.body)
#       results << {site => result}
#     end
#     render json: results
#   end
  
