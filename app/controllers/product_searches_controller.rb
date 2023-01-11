class ProductSearchesController < ApplicationController
    before_action :authorize, only: [:history,:index]

   

    #method to get the user search history
    def history
        render json: current_user.product_searches.uniq(&:search_term), status: :ok    
    end




end
